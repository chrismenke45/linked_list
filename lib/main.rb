require "./lib/linked_list.rb"
list = LinkedList.new()
p list.to_s
list.append("s")
p list.to_s
list.append("t")
p list.to_s
list.prepend("r")
p list.to_s
p list.find("t")
p list.find("r")
p list.find("q")
p list.size
p list.head
p list.tail
p list.at(0)
p list.at(2)
p list.at(100000000000)
p list.at(-1)
p list.at -5
list.pop!
p list.to_s
p list.contains?("r")
p list.contains?("s")
p list.contains?("t")
