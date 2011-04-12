require 'rubygems'
require 'formatador'

files = Dir.glob('*.markdown')

Formatador.display_line

files.each do |file|
  filename, _ = file.split('.', 2)
  Formatador.redisplay("Building: #{filename}")
  source_path = "#{filename}.markdown"
  output_path = "_site/#{filename}.html"
  if File.exists?(output_path)
    File.delete(output_path)
  end
  `kramdown #{source_path} >> #{output_path}`
end

Formatador.display_line
Formatador.display_line
