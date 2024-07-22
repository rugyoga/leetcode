# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
    i = 0
    last = nums.size-1
    while i < nums.size do
        if nums[i] == val
            nums[i] = nums[last]
            nums.pop
            last -= 1
        else
            i += 1
        end
    end
end
