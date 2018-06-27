def foo (a, *b)
	p a
end
foo(1,2,3,4)

puts({"members" => 193, "year" => 2014}.size)

t = Time.now + (60*60*24)
p t

(5..8).each_with_index do |val,i|
	puts "#{i} #{val}"
end

p "compact - [1,1,2,3,5,8]"
p [1,1,2,3,5,8].compact {|x| x*2}
p "collect - [2,2,4,6,10,16]"
p [1,1,2,3,5,8].collect {|x| x*2}
p "map  - [2,2,4,6,10,16]"
p [1,1,2,3,5,8].map {|x| x*2}
p "flatten  - [1,1,2,3,5,8]"
p [1,1,2,3,5,8].flatten {|x| x*2}
p "join - 112358"
p [1,1,2,3,5,8].join {|x| x*2}

h = {1=>2, 3=>4} 
h.clear

p h

a = [1,2,3,4,5]
p a[0..2]


