#Very simple Grep for the day 2 Challenges
#Arguements are pattern,file

pattern = ARGV.shift()
file = ARGV.shift()

puts "Looking for #{pattern} in #{file}"

line_num = 0
matches = 0
File.open(file).each do |line|
  if line.match(pattern)
    puts "#{line_num}:#{line}"
    matches += 1
  else
    #puts "#{line} does not contain #{pattern}"
  end
  line_num +=1
end

puts "=="
puts "total:#{matches} lines"