a = [1, 2, 3, 4, 5]
K = 3
i = 0
loop do
    if i == K
        break
    else
        a.insert(0, a.last)
        a.pop    
    end   
    i = i + 1
    p a.to_s
    p i
end
p a.to_s