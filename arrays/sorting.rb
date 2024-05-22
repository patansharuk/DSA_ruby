class Sorting
    def initialize(array)
        @array = array
    end

    def selection_sort
        array = [*@array]
        arr_len = array.length
        for i in (0...arr_len-1)
            parent_value = array[i]
            sub_min = array[i+1]
            sub_min_index = i+1
            for j in (i+1...arr_len)
                if array[j] < sub_min
                    sub_min = array[j]
                    sub_min_index = j
                end
            end
            if parent_value > sub_min
                array[i] = sub_min
                array[sub_min_index] = parent_value
            end
        end
        p "selecttion sorted array is #{array}"
        array
    end

    def bubble_sort
        array = [*@array]
        arr_len = array.length
        for i in (0..arr_len-2)
            for j in (0...arr_len-1)
                if array[j] > array[j+1]
                    temp = array[j]
                    array[j] = array[j+1]
                    array[j+1] = temp
                end
            end
        end
        p "the bubble sorted array is #{array}"
        array
    end

    def quick_sort(arr)
        """ provide the array that should be copied version of original array
            if using for comparision.
            arr = [-1,0,-1,6,5,4,1,2,3]
            sorted_arr = Sorting.new(arr).quick_sort([*arr])
            p arr.sort == sorted_arr
        """
        return arr if arr.length <= 1
    
        pivot = arr.pop
        left, right = arr.partition { |x| x <= pivot }
        return *quick_sort(left), pivot, *quick_sort(right)
    end
end

arr = [-1,0,-1,6,5,4,1,2,3]
sorted_arr = Sorting.new(arr).quick_sort([*arr])
p arr.sort == sorted_arr
