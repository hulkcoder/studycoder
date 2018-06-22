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

p "compact"
p [1,1,2,3,5,8].compact {|x| x*2}
p "collect"
p [1,1,2,3,5,8].collect {|x| x*2}
p "map"
p [1,1,2,3,5,8].map {|x| x*2}
p "flatten"
p [1,1,2,3,5,8].flatten {|x| x*2}
p "join"
p [1,1,2,3,5,8].join {|x| x*2}

doc = << EOF
 The quick brown fox
 jumps over the lazy dog
EOF