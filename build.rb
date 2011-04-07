files = Dir.glob('*.markdown')

files.each do |file|
  filename, _ = file.split('.')
  source_path = "#{filename}.markdown"
  output_path = "_site/#{filename}.html"
  if File.exists?(output_path)
    File.delete(output_path)
  end
  `kramdown #{source_path} >> #{output_path}`
end
