require 'fileutils'

csharp_dir = '/Users/erik/Code/exercism/csharp/exercises/practice'
ballerina_dir = '/Users/erik/Code/exercism/ballerina/exercises/practice'

Dir.each_child(csharp_dir) do |dir|
  source_dir = "#{csharp_dir}/#{dir}"
  target_dir = "#{ballerina_dir}/#{dir}"
  next if Dir.exist?(target_dir)

  FileUtils.copy_entry source_dir, target_dir

  `find exercises/practice -type f -name .editorconfig -exec rm {} \\;`
  `find exercises/practice -type f -name '*.csproj' -exec rm {} \\;`
  `find exercises/practice -type f -name instructions.append.md -exec rm {} \\;`
  `find exercises/practice -type f -name config.json -exec rm {} \\;`
  `find exercises/practice -type f -name Folder.DotSettings.User -exec rm {} \\;`

  `mkdir -p #{target_dir}/tests`
  `mkdir -p #{target_dir}/.meta/reference`

  csharp_name = dir.split('-').collect(&:capitalize).join
  ballerina_name = dir.gsub('-', '_')

  test_file = "#{target_dir}/tests/#{ballerina_name}_test.bal"

  `mv #{target_dir}/#{csharp_name}.cs #{target_dir}/#{ballerina_name}.bal`
  `mv #{target_dir}/#{csharp_name}Tests.cs #{test_file}`
  `mv #{target_dir}/.meta/Example.cs #{target_dir}/.meta/reference/#{ballerina_name}.bal`

  `cp #{ballerina_dir}/sieve/Ballerina.toml #{target_dir}/Ballerina.toml`
  `cp #{ballerina_dir}/sieve/Dependencies.toml #{target_dir}/Dependencies.toml`

  `sed -i 's/sieve/#{ballerina_name}/' #{target_dir}/Ballerina.toml`
  `sed -i 's/sieve/#{ballerina_name}/' #{target_dir}/Dependencies.toml`

  system("sed -i -E -e '/^using/d' #{test_file}")
  system("sed -i -E -e '/public class/d' #{test_file}")
  system("sed -i -E -e 's/public void (.+)/function \\1/' #{test_file}")
  system("sed -i -e :a -e '/./,$!d;/^\\n*$/{$d;N;};/\\n$/ba' #{test_file}")
  system("sed -i '1d; $d' #{test_file}")
  system("sed -i -E -e 's/\\[Fact.+?\\]/@test:Config/' -e 's/Assert\\.(True|False)/test:assert\\1/' -e 's/Assert.Equal/test:assertEquals/' #{test_file}")
  system("sed -i '1s/^/import ballerina\\/test;\\n\\n/' #{test_file}")
  system("sed -i -E -e 's/_([a-z])/\\U\\1/g' #{test_file}")
  system("sed -i -E -e 's/^    //' #{test_file}")
  system("sed -i -E -e '/^\\{/d' #{test_file}")
  system("sed -i -E -e 's/^function(.+)/function\\1 {/' #{test_file}")
  system("sed -i -E -e 's/new (.+?)\\[0\\]/[]/' #{test_file}")
  system("sed -i -E -e 's/new(\\[\\]| List<[^>]+>) \\{([^\\}]+)\\}/[\\2]/g' #{test_file}")
end

`bin/fetch-configlet`
`bin/configlet sync --update --yes --tests include --docs --filepaths --metadata`
