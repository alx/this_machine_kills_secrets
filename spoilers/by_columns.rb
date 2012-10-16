require 'csv'
#
# This script ca be used to display the morse code on the argument page
# 
# Usage :
# $ ruby verify_code_on_page.rb 202
# .- .. -.-- --- ...
#
secrets = CSV.read("../secret.csv", {:headers => true})

16.times do |i|
  message = ""
  secrets.each do |r| 
    message += r["code"][i]
  end
  if i < 9
    puts "#{i + 1}  : #{message}"
  else
    puts "#{i + 1} : #{message}"
  end
end
