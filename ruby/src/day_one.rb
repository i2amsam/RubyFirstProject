puts "hello, world!"

language="Ruby"

puts "hello, #{language}"

language=' or... goodbye?'

puts "hello, #{language}"

x=4

if x == 4
  puts 'This appear to be true.'
end

unless x == 4
  puts 'This appears to be false'
else
  puts 'This appears to be true'
end

puts "when pigs fly" if !true
puts "bork!" if not true

x= x+1 while x<20
puts x
x=x-1 until x==1
puts x

while x<10
  x=x+1
  puts x
end

puts "one is true" if 1
puts "zero is false" unless 0
puts "strings are true" if "some string"
puts "empty string is false" unless ""
puts "nil is false" unless nil

def add_them_up
  4 + "four"
end

i=0
a=["100.1", 100.0]

while i < 2
  puts a[i].to_i
  i = i+1
end

puts "Hello, World!"

puts "Hello Ruby".index("Ruby")
i=0
while i<10
  puts "Sam - Output number: #{i}"
  i=i+1
end

guess = 0
answer = rand(512)
while guess != answer
  if guess < answer
    puts "no, #{guess} is too low"
  else
    puts "no #{guess} is too high"
  end
  guess = gets().to_i
end
puts "you got it!"