class Rotations
    def initialize(array)
        @array = array
    end

    def rotate_by_one
        array = [*@array]
        temp = array[-1]
        for each in (0...array.length - 1)
            array[each] = array[each + 1]
        end
        array[-1] = temp
        p "rotated array is #{array}"
    end

    def juggle_rotate
        def gcd(a, b)
            while b > 0
                a, b = b, a % b
            end
            return a
        end
        # concept is clear but confused
        array = [*@array]
        arr_len = array.length
        shifts = 2
        shifts = shifts % arr_len
        g_c_d = gcd(arr_len, shifts)
        
        for i in (0...g_c_d)
            temp = array[i]
            j = i
            while true
                k = (j + shifts) % arr_len
                if k == i
                    break
                end
                array[j] = array[k]
                j = k
            end
            array[j] = temp
        end
        p array
    end

    def reversal_rotate
        arr = [*@array]
        def reverse_array(arr, start, finish)
            while start < finish
                arr[start], arr[finish] = arr[finish], arr[start]
                start += 1
                finish -= 1
            end
        end

        n = arr.length
        k = 1
        k = k % n
        reverse_array(arr, 0, n - 1)
        reverse_array(arr, 0, k - 1)
        reverse_array(arr, k, n - 1)
        p arr
    end
end


arr = [1,2,3,4,5]
Rotations.new(arr).reversal_rotate