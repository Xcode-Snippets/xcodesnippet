require 'yaml'
require 'yaml/front-matter'
require 'fileutils'
require 'securerandom'

USER_XCODE_SNIPPETS_DIRECTORY = File.expand_path("~/Library/Developer/Xcode/UserData/CodeSnippets/")

command :install do |c|
  c.syntax = 'codesnippet install [SNIPPET]'
  c.summary = 'Create and Install an Xcode Snippet'
  c.description = 'Creates and installs an Xcode .codesnippet file from an source file annotated with YAML front matter.'

  c.example 'description', 'codesnippet install /path/to/code.source'

  c.action do |args, options|
    say_error "Input file required" and abort unless @input_filepath = args.first
    say_error "Input file does not exist" and abort unless File.exist?(@input_filepath)

    @content = File.read(@input_filepath)
    say_error "Input file is empty" and abort if @content.empty?

    extract_front_matter!

    @output_filepath = File.join(USER_XCODE_SNIPPETS_DIRECTORY, @snippet.identifier + ".codesnippet")
    begin
      FileUtils.mkdir_p(USER_XCODE_SNIPPETS_DIRECTORY)

      File.open(@output_filepath, 'w') do |f|
        f.write @snippet.to_plist
      end
    rescue => error
      say_error "Error: #{error.message}" and abort
    end

    say_ok "Installed Code Snippet"
    puts @output_filepath
  end
end

private

def extract_front_matter!
  @snippet = XcodeSnippet::Snippet.new

  front_matter, contents = YAML::FrontMatter.extract(@content)

  if front_matter.empty?
    say_error "No YAML Front Matter Detected" and abort
  else
    @snippet.contents = contents.strip
    @snippet.completion_prefix = File.basename(@input_filepath, File.extname(@input_filepath))
    @snippet.language = case File.extname(@input_filepath)
                        when ".swift" then "Xcode.SourceCodeLanguage.Swift"
                        when ".m" then "Xcode.SourceCodeLanguage.Objective-C"
                        when ".mm" then "Xcode.SourceCodeLanguage.Objective-C++"
                        else ""
                        end
    @snippet.title = front_matter["title"] || @snippet.completion_prefix
    @snippet.summary = front_matter["summary"] || @snippet.completion_prefix
    if front_matter["completion-scope"]
      @snippet.completion_scopes = [front_matter["completion-scope"]]
    elsif(front_matter["completion-scopes"])
      @snippet.completion_scopes = front_matter["completion-scopes"]
    else    
      @snippet.completion_scopes =  "All"
    end
    @snippet.identifier = @snippet.completion_prefix
    @snippet.is_user_snippet = true
    @snippet.version = 2
  end
end
