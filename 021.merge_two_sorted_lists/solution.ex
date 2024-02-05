defmodule Solution do
  @spec merge_two_lists(list1 :: ListNode.t | nil, list2 :: ListNode.t | nil) :: ListNode.t | nil
  def merge_two_lists(nil, list), do: list
  def merge_two_lists(list, nil), do: list
  def merge_two_lists(list1, list2) do
    if list1.val < list2.val do
      %ListNode{ list1 | next: merge_two_lists(list1.next, list2) }
    else
      %ListNode{ list2 | next: merge_two_lists(list2.next, list1) }
    end
  end
end
