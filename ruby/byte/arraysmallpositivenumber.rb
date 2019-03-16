positive = []
for i in [1, 3, 4, 5, 1, 2].sort do
    if i > 0 
        positive.push(i)
    end
end
lowest = 1
if positive.size > 0
    i = 0
    loop do
        if (i < positive.size)
            if i+1 >= positive.size
                lowest = lowest + 1
                break
            else
                diff = positive[i+1] - positive[i]
                if  diff == 0
                    lowest = positive[i+1]
                elsif diff == 1
                    lowest = positive[i+1] 
                else
                    lowest = positive[i]                    
                end
            end
        else
            break
        end  
        #p i          
        i = i + 1
    end
end
p lowest