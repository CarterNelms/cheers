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
anLetters = ['a', 'e', 'f', 'h', 'i', 'l', 'm', 'n', 'o', 'r', 's', 'x', '8']
if name.empty?
  puts "You must enter your name!"
  exit
else
  puts "Your name is #{name}"
  name.upcase.each_char do |char|
    if char != " "
      article = (anLetters.include? char.downcase) ? "an" : "a"
      gap = article.length === 1 ? " " : ""
      puts "Give me #{article}... #{gap}#{char}"
    end
  end
  puts "#{name} is just GRAND!"

  # --- Part 2 ---
  # Add on to part 1! Follow up on the cheer above by asking:

  # Hey, Abby, what’s your birthday?

  # And, replying based on the output with a notification of how many days away their birthday is:

  # Awesome!  Your birthday is in 45 days! Happy Birthday in advance!
  puts "Hey, #{name}, when is your birthday?"
  bdayStr = gets.chomp
  require 'date'
  bday = Date.parse(bdayStr + " 2016")
  today = Date.today
  # today = Date.new(2016, 2, 29) # Toy with this line to test leap years

  def daysAway(dFirst, dLast)
    return dLast - dFirst
  end
  yearToCheckForLeap = today.year + (today.yday < 60 ? 0 : 1) # Day 60 is the first day after feb 28
  maxDays = Date.leap?(yearToCheckForLeap) ? 365 : 364
  dif = daysAway(today, bday)
  if dif < 0 || dif > maxDays
    year = today.yday > bday.yday ? today.year+1 : today.year
    month = bday.month
    day = bday.month === 2 && bday.day === 29 && !Date.leap?(year) ? 28 : bday.day
    bday = Date.new(year, month, day)
  end

  days = daysAway(today, bday).round()
  if days != 0
    puts "Awesome! Your birthday is in #{days} day#{days === 1 ? '' : 's'}! Happy Birthday in advance!"
  else
    puts "Happy Birthday, #{name}!"
  end
end