def tell_the_truth
  return true
end

def implicitly_true
  true or false
end

puts tell_the_truth
puts implicitly_true

animals = ['molerats', 'echnidia', 'mittens']
puts animals

def printElemAt(idx)
  animals = ['molerats', 'echnidia', 'mittens']
  puts "animal ##{idx}:#{animals[idx]}"
end

printElemAt(0)
printElemAt(-1)
printElemAt(10)
printElemAt(0..1)
printElemAt(-1..-2)

puts [1].class
puts [1].methods.include?(:[])
a=[]
a[0] = 'zero'
a[1] = 1
a[2] = ['one', 'two']
puts a
puts a[2][1]

puts "testing push pop"
a=[1]
a.push(1)
a.push(2)
puts a.to_s
puts a.pop
a.pop
puts a.to_s

def tell_the_truth(options={})
  if options[:professsion] == :lawyer
    return 'with a high degree of certitude'
  else
    return true
  end
end

puts tell_the_truth
puts tell_the_truth(:professsion => :lawyer)
puts tell_the_truth(:professsion => "lawyer") #Does not catch because string != symbol

3.times { puts 'all work and no play make homer go something-something' }

animals.each { |a| puts "today I shall eat: #{a}" }


class Fixnum
  def my_times
    i = self
    while i > 0
      i = i - 1
      yield
    end
  end
end

3.my_times { puts "oh dear!" }

def call_block(&block)
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block { puts "lambdas!" }


class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Root", [Tree.new("LeafA"), Tree.new("LeafB")])

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }

puts "Visiting all nodes"
ruby_tree.visit_all { |node| puts node.node_name }


module ToFile
  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    File.open(filename, 'w') { |f| f.write(to_s) }
  end
end

class Person
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

#Uncomment to test the file writing
#Person.new('matz').to_f

puts "End of section challenges"
puts "Print the contents of an array of 16 numbers, four at a time jusing each"

value_array = []
index_array = []
next_val=0

count = 16;
while (next_val < count)
  index_array.push(next_val)
  value_array.push(count-next_val)
  next_val += 1
end

index_array.each do |i|
  if i % 4 == 0
    p value_array[i..i+3]
  end
end


puts "Now with each slice"
value_array.each_slice(4) { |s| p s }

puts "The tree class was interesting, but the creation was difficult, let the initializer accept nested hashes"

class TreeWithHashes
  attr_accessor :children

  def initialize(children={})
    @children = children
  end

  def visit_all (values=@children, location="", &block)
    visit(location, &block)
    values.each_pair { |k, v| visit_all(v, k, &block) }
  end

  def visit(location, &block)
    block.call location
  end
end

hash_tree = TreeWithHashes.new({'grandpa' =>
                                    {'dad' => {'child1' => {}, 'child2' => {}},
                                     'uncle' => {'child3' => {}, 'child4' => {}}}
                               })

puts "Visiting all nodes"
hash_tree.visit_all { |node| puts node }

