MAP = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000 }

def roman_to_int(s)
    nums = s.chars.map{ |char| MAP[char] }
    i = 0
    n = nums.size
    while i < n do
        if i+1 < n && nums[i] < nums[i+1]
            nums[i] = nums.delete_at(i+1) - nums[i]
            n -= 1
        else
            i += 1
        end
    end
    nums.sum
end
