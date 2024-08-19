var combinationSum3 = function(k, n) {
    const max = 9;
    const solutions = []
    const solution = []

    function helper(candidate, sum){
        if (solution.length == k){
            if (sum == n) solutions.push([...solution])
            return
        }
        if (candidate <= max && sum + candidate <= n) {
            solution.push(candidate)
            helper(candidate+1, sum+candidate)
            solution.pop()
            helper(candidate+1, sum)
        }
    }

    helper(1, 0)
    return solutions
};
