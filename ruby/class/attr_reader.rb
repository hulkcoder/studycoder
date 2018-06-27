class  Surface  
    attr_reader  :s  
    def  initialize(x,y)  
      @s  =  x  *  y  
    end  
end  
class  Volume  <  Surface  
    attr_reader  :v  
    def  initialize(x,y,z)  
        super(x,y)  
        @v  =  x  *  y  *  z  
    end  
end  
a  =  Volume.new(2,5,5)  
puts  "#{a.v},#{a.s}"