require "bundler/setup"

gemspec = eval(File.read("xcodesnippet.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["xcodesnippet.gemspec"] do
  system "gem build xcodesnippet.gemspec"
end
