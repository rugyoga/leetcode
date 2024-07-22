MIN = -2.pow(31)
MAX = 2.pow(31) -1

def my_atoi(s)
    chars = s.lstrip.chars # remove whitespace
    #chars = chars.drop_while{ |char| char == " " }
    puts chars.inspect
    negate = false
    negate = chars.shift == "-" if ["-", "+"].member?(chars[0])
    digits = chars.take_while{ |char| char.match?(/[[:digit:]]/) }
    n = digits.join.to_i
    n = -n if negate
    n = MIN if n < MIN
    n = MAX if n > MAX
    n
end
