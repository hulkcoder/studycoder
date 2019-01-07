class  Surface  
    attr_reader  :s  
    def initialize(x,y)  
      	@s  =  x  *  y  
    end  
end
class  Volume  <  Surface  
    attr_accessor :v
    def initialize(x,y,z)  
        super(x,y)  
        @v  =  x  *  y  *  z  
    end
end
a  =  Volume.new(2,5,5)  
puts  "#{a.v},#{a.s}"
a.v = 1 #attr_accessor
puts  "#{a.v},#{a.s}"
a.s = 9 # undefined method `s=' for #<Volume:0x00000000022a11e0 @s=10, @v=1> (NoMethodError)