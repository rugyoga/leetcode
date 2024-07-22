defmodule Solution do
  @spec int_to_roman(num :: integer) :: String.t
  def int_to_roman(num) when num >= 1000, do:  "M" <> int_to_roman(num - 1000)
  def int_to_roman(num) when num >= 900,  do: "CM" <> int_to_roman(num -  900)
  def int_to_roman(num) when num >= 500,  do:  "D" <> int_to_roman(num -  500)
  def int_to_roman(num) when num >= 400,  do: "CD" <> int_to_roman(num -  400)
  def int_to_roman(num) when num >= 100,  do:  "C" <> int_to_roman(num -  100)
  def int_to_roman(num) when num >=  90,  do: "XC" <> int_to_roman(num -   90)
  def int_to_roman(num) when num >=  50,  do:  "L" <> int_to_roman(num -   50)
  def int_to_roman(num) when num >=  40,  do: "XL" <> int_to_roman(num -   40)
  def int_to_roman(num) when num >=  10,  do:  "X" <> int_to_roman(num -   10)
  def int_to_roman(num) when num >=   9,  do: "IX" <> int_to_roman(num -    9)
  def int_to_roman(num) when num >=   5,  do:  "V" <> int_to_roman(num -    5)
  def int_to_roman(num) when num >=   4,  do: "IV" <> int_to_roman(num -    4)
  def int_to_roman(num) when num >=   1,  do:  "I" <> int_to_roman(num -    1)
  def int_to_roman(0), do:  ""
end
