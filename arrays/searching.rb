class Algorithms
    def initialize(array)
        @array = array
    end

    def linear_search
        """
            search for target element in linear fashion.
            suitable for small datasets.
        """
        for each in @array
            n = 4
            if each == n
                p "found the value #{n} by linear search."
                return
            end
        end
        p 'value not found!'
    end

    def sentinel_linear_search
        target = 3
        last = @array[-1]
        @array[-1] = target
        i = 0

        while @array[i] != target
            i += 1
        end

        @array[-1] = last
        if (i < @array.length - 1) or (@array[@array.length - 1] == target)
            p "key present at index #{i}"
        else
            p 'Element not found!'
        end
    end

    def binary_search
        low, high, target = 0, @array.length - 1 , 4
        while low <= high do
            mid = low + (high - low) / 2

            if @array[mid] == target
                p "Element found at index - #{mid}"
                return
            elsif @array[mid] < target
                low = mid + 1
            else
                high = mid - 1
            end
        end
        p 'Element not found!'
    end

    def jump_search
        step_value = 4
        jump_index = step_value
        target = 1
        while(jump_index <= @array.length)
            if @array[jump_index] < target
                jump_index += step_value
            else
                jump_index -= step_value
                for each in (jump_index..(jump_index+step_value))
                    if @array[each] == target
                        p "element found at index - #{each}"
                        return
                    end
                end
                p 'element not found!'
                return
            end
        end
        p 'element not found!'
    end
end

arr = [1,2,3,4,5,6,7,8,9]
Algorithms.new(arr).jump_search















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


def problems
    puts 'The 3 largest numbers are:'
    print3largest([1, 2, 4, -1])

    puts 'The missing number is:'
    missingNumber([5,4,3,1,6,7,8], 8)

    puts 'The first repeating element is:'
    firstRepeatingElement([5,2,6,4,7,2,5])

    puts 'Sum of two elements closest to zero is:'
    sumCloseToZero([-8, -66, -60])
end

# problems
