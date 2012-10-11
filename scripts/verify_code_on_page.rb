require 'csv'
#
# This script ca be used to display the morse code on the argument page
# 
# Usage :
# $ ruby verify_code_on_page.rb 202
# .- .. -.-- --- ...
#

chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
codes = %w(.- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. --
           -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..)

MORSE = Hash[chars.split("").zip(codes)]
MORSE.default=" "

def char2morse(chars)
  chars.split("").map{|c|MORSE[c]}.join(" ")
end

currentPage = ARGV.first
secrets = CSV.read("../secret.csv", {:headers => true})

secrets.each do |r| 
  p char2morse(r["code"]) if r["page"].to_i == currentPage.to_i
end
