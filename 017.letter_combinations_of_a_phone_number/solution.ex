defmodule Solution do
  @map %{
    ?2 => ["a", "b", "c"],
    ?3 => ["d", "e", "f"],
    ?4 => ["g", "h", "i"],
    ?5 => ["j", "k", "l"],
    ?6 => ["m", "n", "o"],
    ?7 => ["p", "q", "r", "s"],
    ?8 => ["t", "u", "v"],
    ?9 => ["w", "x", "y", "z"]
  }
  @spec letter_combinations(digits :: String.t) :: [String.t]

  def letter_combinations(""), do: []
  def letter_combinations(<<digit::utf8>>), do: @map[digit]
  def letter_combinations(<<digit::utf8, digits::binary>>) do
    letter_combinations(digits)
    |> Enum.flat_map(fn letters -> @map[digit] |> Enum.map(fn letter -> letter <> letters end) end)
  end
end
