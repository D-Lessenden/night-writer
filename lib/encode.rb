class Encode

def encode_to_braille(input)
  if input.length == 1
    one_letter_encode(input)
  else
    long_encode(input)
  end
end#method end

def encode_to_braille_wrap(input)
  wrap = input.scan(/.{1,80}/)
  braille_wrap = wrap.map do |input|
    long_encode(input)
  end.join("\n")
end

def dictionary
  #maybe this can be its own class?
  dictionary = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."]
    }
  end

  def one_letter_encode(input)
    braille_array = []
    dictionary.each do |letter, braille|
      braille_array << braille if letter == input
    end
    first_row = []
    second_row = []
    third_row = []
    braille_array.each do |braille_letter|
        first_row << braille_letter[0]
        second_row << braille_letter[1]
        third_row << braille_letter[2]
    end
     return "#{first_row.join}\n#{second_row.join}\n#{third_row.join}"
  end

  def long_encode(input)
    braille_array = []
    string_array = input.chars
    string_array.each do |letter|
      dictionary.select do |k, v|
        braille_array << v if k == letter
      end
    end
    first_row = []
    second_row = []
    third_row = []
    braille_array.each do |braille_letter|
        first_row << braille_letter[0]
        second_row << braille_letter[1]
        third_row << braille_letter[2]
    end
     return "#{first_row.join}\n#{second_row.join}\n#{third_row.join}"
  end#method

end#class
