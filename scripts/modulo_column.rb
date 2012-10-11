require 'csv'
#
# This script ca be used to display the morse code on the argument page
# 
# Usage :
# $ ruby verify_code_on_page.rb 202
# .- .. -.-- --- ...
#
secrets = CSV.read("../secret.csv", {:headers => true})
ascii_shift = 64

16.times do |i|
  message = ""
  shift = ""
  message_count = 0
  index = 0
  secrets.each do |r| 
    message += r["code"][i]
    message_count += r["code"][i].ord - ascii_shift
    #puts "segment #{r}  - position #{i} - value #{r["code"][i]} - mask #{"THATTHEIROWN"[index % 12]}"
    shift += (((r["code"][i].ord - ascii_shift) - ("THATTHEIROWN"[index % 12].ord - ascii_shift) ) % 26 + ascii_shift).chr
    index += 1
  end
  #puts "message: " + message
  #puts "shifted: " + shift
end

by_line = ""
secrets.each do |line|
  count = 0
  16.times do |letter|
    count += line["code"][letter].ord - ascii_shift
  end
  puts line["page"] + (count % 26 + ascii_shift).chr
end
puts by_line

