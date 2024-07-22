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
  @spec remove_nth_from_end(head :: ListNode.t | nil, n :: integer) :: ListNode.t | nil
  def remove_nth_from_end(head, n) do
    number(head, n) |> elem(1)
  end

  def number(nil, _), do: {1, nil}
  def number(node, target) do
    {n, next} = number(node.next, target)
    {n+1,
     cond do
     n == target -> next
     n < target -> node
     true -> %ListNode{ node | next: next}
     end
    }
  end
end
