# Build on the results of our in-class exploration to output, for example:

# Give me an... A
# Give me a... B
# Give me a... B
# Give me a... Y
# ABBY’s just GRAND!

# When given the input of “Abby”.

# Note: the “a” vs. “an”

puts "What is your name? "
name = gets.chomp
anLetters = ['a', 'e', 'f', 'h', 'i', 'l', 'm', 'n', 'o', 'r', 's', 'x']
if name.empty?
  puts "You must enter your name!"
  exit
else
  puts "Your name is #{name}"
  name.upcase.each_char do |char|
    article = (anLetters.include? char.downcase) ? "an" : "a"
    gap = article.length === 1 ? " " : ""
    puts "Give me #{article}... #{gap}#{char}"
  end
end