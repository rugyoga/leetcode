defmodule Solution do
  @spec generate_parenthesis(n :: integer) :: [String.t]
  def generate_parenthesis(n) do
    generate(n, n) |> List.flatten()
  end

  def generate(0, 0), do: [""]
  def generate(0, closed), do: [String.duplicate(")", closed)]
  def generate(open, closed) when open == closed, do: generate(open-1, closed) |> Enum.map(fn parens -> "(" <> parens end)
  def generate(open, closed) do
    Enum.map(generate(open-1, closed), fn parens -> "(" <> parens end) ++
    Enum.map(generate(open, closed-1), fn parens -> ")" <> parens end)
  end
end
