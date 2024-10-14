class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        for i in range(n):
            for j in range(i):
                if nums[i] + nums[j] == target:
                    return [i, j]

        return 1