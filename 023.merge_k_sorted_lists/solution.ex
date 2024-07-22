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
  @spec merge_k_lists(lists :: [ListNode.t | nil]) :: ListNode.t | nil
    def merge_k_lists([[]]), do: nil
    def merge_k_lists(lists) do
    lists
    |> Enum.filter(& &1)
    |> Enum.sort_by(fn l -> l.val end)
    |> remove_and_remerge()
  end

  def remove_and_remerge([]), do: nil
  def remove_and_remerge([l | rest]) do
    %ListNode{val: l.val, next: remove_and_remerge(merge(l.next, rest))}
  end

  def merge(nil, rest), do: rest
  def merge(anode, []), do: [anode]
  def merge(%ListNode{val: a} = a_node, [%ListNode{val: b}| rest] = list) when a <= b, do: [a_node | list]
  def merge(a_node, [b_node | rest]), do: [b_node | merge(a_node, rest)]
end
