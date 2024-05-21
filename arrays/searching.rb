# Find the largest three distinct elements in an array
# o/p - 6, 5, 4
# O(n) time complexity

def print3largest(arr)
    if arr.length < 3
        p "Invalid Imput"
        return
    end
    x = 0
    y = 0
    z = 0

    for n in arr
        if n > x
            z = y
            y = x
            x = n
        elsif n > y
            z = y
            y = n
        elsif n > z
            z = n
        end
    end
    p [x, y, z]
    return 
end

print3largest([1, 2, 4, -1])