require 'rubygems'
require 'bundler'
require 'bundler/cli'
require 'fileutils'
require 'formatador'
Formatador.display_line

# nuke old pkg directory if it exists and recreate
if File.exists?('pkg')
  FileUtils.rm_rf('pkg')
end
Dir.mkdir('pkg')
Dir.mkdir('pkg/learn_fog')

# compile the markdown files
Dir.glob('*.markdown').each do |file|
  Formatador.redisplay("Compiling: #{file}")
  filename, _ = file.split('.', 2)
  source_path = "#{filename}.markdown"
  output_path = "pkg/learn_fog/#{filename}.html"
  if File.exists?(output_path)
    File.delete(output_path)
  end
  `kramdown #{source_path} >> #{output_path}`
end

# copy files from resources
Dir.glob('resources/*').each do |file|
  Formatador.redisplay("Copying: #{file}")
  FileUtils.cp_r(Dir.glob('resources/*'), 'pkg/learn_fog')
end

# package gems
Formatador.redisplay("Packaging Gems")
`BUNDLE_GEMFILE='#{File.expand_path(Dir.pwd)}/pkg/learn_fog/Gemfile' bundle package`


# checkout a copy of source
Formatador.redisplay("Cloning Source")
Dir.chdir('pkg/learn_fog')
`git clone -q git://github.com/geemus/fog.git source`

# package learn_fog
Formatador.redisplay("Packaging")
Dir.chdir('..')
`tar -zcvf learn_fog.tar.gz learn_fog`

Formatador.display_lines(['',''])
