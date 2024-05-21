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


# Find the Missing Number
def missingNumber(arr, n)
    if !arr
        p 'array not found'
        return
    end
    res = 0
    temp = {}
    for each in arr
        temp[each] = 1
    end

    for each in (1..n)
        if temp[each].nil?
            p each
            return
        end
    end
    p 'There are no such missing numbers'
end

# Find the first repeating element in an array of integers
def firstRepeatingElement(arr)
    if !arr
        p 'array not found'
        return
    end
    res = {}
    for each in arr
        if res[each].nil?
            res[each] = each
        else
            p each
            return
        end
    end
    p 'Repeating elememts not found'
end

# Sum of two elements whose sum is closest to zero
def sumCloseToZero(arr)
    arr_len = arr.length
    res = arr[0] + arr[1]
    for i in (0...arr_len)
        for j in ((i+1)...arr_len)
            obj = {}
            sums = arr[i] + arr[j]
            obj['sums_diff'] = sums
            sums_diff = -(sums) if sums < 0
            res_diff = -(res) if res < 0

            res = obj['sums_diff'] if sums_diff < res_diff 
        end
    end
    p res
end


def main
    puts 'The 3 largest numbers are:'
    print3largest([1, 2, 4, -1])

    puts 'The missing number is:'
    missingNumber([5,4,3,1,6,7,8], 8)

    puts 'The first repeating element is:'
    firstRepeatingElement([5,2,6,4,7,2,5])

    puts 'Sum of two elements closest to zero is:'
    sumCloseToZero([-8, -66, -60])
end

main()