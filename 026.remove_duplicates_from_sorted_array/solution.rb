# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    i = 0
    j = 0
    n = nums.size
    while j < n do
        while j+1 < n && nums[j] == nums[j+1] do
            j += 1
        end
        nums[i] = nums[j]
        i += 1
        j += 1
    end
    i
end
