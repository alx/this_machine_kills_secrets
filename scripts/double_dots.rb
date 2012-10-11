require 'csv'

secrets = CSV.read("../secret.csv", {:headers => true})

sections = []
currentSection = ""

secrets.each do |r| 
  case r["page"].to_i
  when 216 
    puts "double-dot on page 216"
    puts "code: #{r["code"]}"
    puts "first part: #{r["code"][0...8]}"
    puts "second part: #{r["code"][8...16]}"
    puts "---"
    currentSection << r["code"][0...8]
    sections << currentSection
    currentSection = r["code"][8...16]
  when 265
    puts "double-dot on page 265"
    puts "code: #{r["code"]}"
    puts "first part: #{r["code"][0...8]}"
    puts "second part: #{r["code"][8...16]}"
    puts "---"
    currentSection << r["code"][0...8]
    sections << currentSection
    currentSection = r["code"][8...16]
  else
    currentSection << r["code"]
  end
end

sections << currentSection

sections.each_with_index do |code, index|
  puts "section #{index} (length #{code.length}): #{code}"
end


