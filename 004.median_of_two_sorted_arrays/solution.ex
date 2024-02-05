defmodule Solution do
  @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
  def find_median_sorted_arrays(nums1, nums2) do
    n = length(nums1) + length(nums2)
    median(nums1, nums2, div(n-1,2), rem(n,2) == 0)
  end

  def median([a | as], [], 0, even), do: if(even, do: (a + hd(as))/2.0, else: a)
  def median([_ | as], [], n, even), do: median(as, [], n-1, even)
  def median([], bs, n, even), do: median(bs, [], n, even)
  def median([a | as], [b | bs], 0, even) do
    if a < b do
      if(even, do: (a + median(as, [b | bs], 0, false))/2.0, else: a)
    else
      if(even, do: (b + median([a | as], bs, 0, false))/2.0, else: b)
    end
  end
  def median([a | as], [b | bs], n, even) do
    if a < b do
      median(as, [b | bs], n-1, even)
    else
      median([a | as], bs, n-1, even)
    end
  end
end
