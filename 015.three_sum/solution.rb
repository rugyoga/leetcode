require 'set'

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    nums.sort!
    results = []
    i = 0
    n = nums.size
    while i < n && nums[i] <= 0 do
        two_sum(nums, i, results) if i == 0 || nums[i-1] != nums[i] 
        i += 1
    end
    results
end

def two_sum(nums, i, results)
    lo = i+1
    hi = nums.size - 1
    while lo < hi do
        sum = nums[i] + nums[lo] + nums[hi]
        if sum < 0
            lo += 1
        elsif sum > 0
            hi -= 1
        else
            results.push([nums[i], nums[lo], nums[hi]])
            lo += 1
            hi -= 1
            while lo < hi && nums[lo] == nums[lo-1] do
                lo += 1
            end
        end
    end
end
