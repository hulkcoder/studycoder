a = [1, 2, 1, 2, 3, 4, 3, 4, 6, 7, 7, 8, 6, 8, 5]
#i = 0
#loop do
#    if i == a.size 
#        break 
#    end
#    j = 0
#    loop do
#        if j == a.size 
#            break 
#        end
#        if a[i] == a[j] && i != j            
#            a[i] = 0
#            a[j] = 0
#            break 
#        end
#        j = j + 1
#    end
#    i = i + 1
#end
#for av in a do
#    if av != 0
#        p av
#    end
#end
loop do
    if a.size == 1
        p a[0]
        break
    else
        i = 0
        b = a.select { |e| e == a[i] }
        if b.size > 1
            a.delete(a[i])
            p a
        elsif b.size == 1
            p b[0]
            break
        end
    end
end
#b = a.select { |e| e != 0 }
#p b[0]