String myint = 1041.to_s(2)
p "Binary: #{myint}"
Integer i = myint.size
Integer highestbinarygaplength = 0
Integer totalbinarygap = 0
Integer startcount = 0
loop do
    if i >= 0            
        case myint[i]
        when "0"
            if startcount == 1            
                totalbinarygap = totalbinarygap + 1                
            end
        when "1"
            if totalbinarygap == 0
                startcount = 1
            else
                if totalbinarygap > highestbinarygaplength
                    highestbinarygaplength = totalbinarygap                    
                end
                totalbinarygap = 0
            end
        else
            highestbinarygaplength = highestbinarygaplength
        end
    else
        break   
    end
    i = i - 1
end
p "Total binarygap: #{highestbinarygaplength}" 