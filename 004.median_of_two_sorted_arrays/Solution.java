import java.util.Arrays;
/*
 * This version works by picking a pivot in the smaller array (range)
 * and using Arrays.binarySearch to find its nearest peer in the other array.
 * It passes 2085/2094.
 */
class Solution {
    static public boolean debug = false;

    public static double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int n = nums1.length + nums2.length;
        int median_index = (n-1)/2;
        int median =  nth(nums1, nums2, median_index);
        if (n % 2 == 0) 
            return (double)(median + nth(nums1, nums2, median_index+1))/2.0;
        else
            return (double)median;
    }

    public static int nth(int[] nums1, int[] nums2, int n) {
        if (debug) System.out.println(String.format("nth(%s, %s, %d)", Arrays.toString(nums1), Arrays.toString(nums2), n));
        if (nums2.length < nums1.length) return nth(nums2, nums1, n);
        if (nums1.length == 0) return nth_simple(nums2, n);
        if (nums1[nums1.length-1] <= nums2[0]) 
            return n < nums1.length ? nth_simple(nums1, n) : nth_simple(nums2, n-nums1.length);
        if (nums2[nums2.length-1] <= nums1[0])
            return n < nums2.length ? nth_simple(nums2, n) : nth_simple(nums1, n-nums2.length);
        if (nums1.length + nums2.length < 20) return nth_linear(nums1, 0, nums2, 0, n);
        return nth_binary(nums1, 0, nums1.length-1, nums2, 0, nums2.length-1, n);
    }

    static int nth_simple(int[] nums, int n) {
        if (debug) System.out.println(String.format("nth_simple(%s, %d)", Arrays.toString(nums), n));
        return nums[n];
    }

    static int nth_linear(int[] nums1, int lo1, int[] nums2, int lo2, int n) {
        if (debug) System.out.println(String.format("nth_linear(%s, %d, %s, %d, %d)", Arrays.toString(nums1), lo1, Arrays.toString(nums2), lo2, n));
        while (lo1 + lo2 < n)
        {
          if (nums1[lo1] < nums2[lo2]) {
            if (lo1+1 == nums1.length) return nth_simple(nums2, n-nums1.length);
            lo1 += 1;
          } else {
            if (lo2+1 == nums2.length) return nth_simple(nums1, n-nums2.length);
            lo2 += 1;
          }

        if (debug) System.out.println(String.format("lo1=%d lo2=%d", lo1, lo2));
        }
        return nums1[lo1] < nums2[lo2] ? nums1[lo1] : nums2[lo2];
    }

    static int max(int a, int b) {return a > b ? a : b;}
    static int min(int a, int b) {return a < b ? a : b;}

    static int nth_binary(int[] nums1, int lo1, int hi1, int[] nums2, int lo2, int hi2, int n) {
        if (debug) System.out.println(String.format("nth_binary(%s, %d, %d, %s, %d, %d, %d)", Arrays.toString(nums1), lo1, hi1, Arrays.toString(nums2), lo2, hi2, n));
        int size1 = 1+hi1-lo1;
        int size2 = 1+hi2-lo2;
        if (size1 > size2) return nth_binary(nums2, lo2, hi2, nums1, lo1, hi1, n);
        int mid1 = (lo1+hi1)/2;
        int pivot1 = nums1[mid1];
        int mid2 = Arrays.binarySearch(nums2, pivot1);
        if (mid2 < 0) mid2 = min(max(0, -1-mid2), nums2.length-1);
        int pivot2 = nums2[mid2];
        if (debug) System.out.println(String.format("mid1=%d, pivot1=%d, mid2=%d, pivot2=%d)", mid1, pivot1, mid2, pivot2));
        if (mid1 + mid2 > n)
            if (hi1 == mid1 && hi2 == mid2)
                return nth_linear(nums1, lo1, nums2, lo2, n);
            else
                return nth_binary(nums1, lo1, mid1, nums2, lo1, mid2, n);
        if (mid1 + mid2 < n)
            if (lo1 == mid1 && lo2 == mid2)
                return nth_linear(nums1, lo1, nums2, lo2, n);
            else
                return nth_binary(nums1, mid1, hi1, nums2, mid2, hi2, n);
        return min(pivot1, pivot2);
    }

    static void test(int[] v1, int[] v2, double expected) {
        if (findMedianSortedArrays(v1, v2) != expected) {
            debug = true;
            String v1s = Arrays.toString(v1), v2s = Arrays.toString(v2);
            System.out.println(String.format("findMedianSortedArrays(%s, %s) == %f != %f", v1s, v2s, findMedianSortedArrays(v1, v2), expected));
            debug = false;
        }
    }

    public static void main(String [] args) {
        test(new int[]{1, 3}, new int[]{2}, 2.0);
        test(new int[]{1, 2}, new int[]{3, 4}, 2.5);
        test(new int[]{}, new int[]{1}, 1.0);
        test(new int[]{2}, new int[]{1,3,4,5}, 3.0);
        test(new int[]{2}, new int[]{1,3,4,5,6,7,8,9,10}, 5.5);
        test(new int[]{0, 0, 0, 0, 0}, new int[]{-1,0,0,0,0,0,1}, 0.0);
        test(new int[]{1,2,3,4,6}, new int[]{5,7,8,9,10}, 5.5);
        test(new int[]{1,9,10}, new int[]{2,3,4,5,6,7,8}, 5.5);
        test(new int[]{1,2,3,6,7}, new int[]{4,5,8,9,10}, 5.5);
    }
}