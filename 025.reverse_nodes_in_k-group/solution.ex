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
  @spec reverse_k_group(head :: ListNode.t | nil, k :: integer) :: ListNode.t | nil
  def reverse_k_group(head, k) do
    if at_least?(head, k) do
      flip(head, k, reverse_k_group(drop(head, k), k))
    else
      head
    end
  end

  def flip(_, 0, tail), do: tail
  def flip(%ListNode{val: val, next: next}, n, tail), do: flip(next, n-1, %ListNode{val: val, next: tail})

  def at_least?(_, 0), do: true
  def at_least?(nil, _), do: false
  def at_least?(%ListNode{next: tail}, n), do: at_least?(tail, n-1)

  def drop(head, 0), do: head
  def drop(nil, _), do: nil
  def drop(%ListNode{next: tail}, n), do: drop(tail, n-1)
end
