require 'plist'

module XcodeSnippet
  class Snippet
    attr_accessor :completion_prefix
    attr_accessor :completion_scopes
    attr_accessor :contents
    attr_accessor :identifier
    attr_accessor :is_user_snippet
    attr_accessor :language
    attr_accessor :summary
    attr_accessor :title
    attr_accessor :version

    def to_plist
      {
        "IDECodeSnippetCompletionPrefix" => @completion_prefix,
        "IDECodeSnippetCompletionScopes" => @completion_scopes,
        "IDECodeSnippetContents" => @contents,
        "IDECodeSnippetIdentifier" => @identifier,
        "IDECodeSnippetLanguage" => @language,
        "IDECodeSnippetSummary" => @summary,
        "IDECodeSnippetTitle" => @title,
        "IDECodeSnippetUserSnippet" => @is_user_snippet,
        "IDECodeSnippetVersion" => @version
      }.to_plist
    end
  end
end
