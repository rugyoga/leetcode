# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec swap_pairs(head :: ListNode.t | nil) :: ListNode.t | nil
  def swap_pairs(nil), do: nil
  def swap_pairs(%ListNode{next: nil} = singleton), do: singleton
  def swap_pairs(%ListNode{val: a, next: %ListNode{val: b, next: c}}), do: %ListNode{val: b, next: %ListNode{val: a, next: swap_pairs(c)}}
end
