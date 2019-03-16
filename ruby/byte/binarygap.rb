String myint = 9.to_s(2)
p "Binary: #{myint}"
Integer i = myint.size
Integer totalbinarygap = 0
Integer startcount = 0
loop do
    if i >= 0            
        case myint[i]
        when "0"
            if startcount == 1            
                totalbinarygap = totalbinarygap + 1
                startcount = 0
            end
        when "1"
            startcount = 1
        else
            totalbinarygap = totalbinarygap
        end
    else
        break   
    end
    i = i - 1
end
p "Total binarygap: #{totalbinarygap}" 