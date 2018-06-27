File.open("FOO","r")  do  |io|  
    puts  io.gets  
  	puts  io.read  
    io.rewind  
    p  lines  =  io.readlines  
end