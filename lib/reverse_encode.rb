class ReverseEncode

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

    def invert
      dictionary.invert
    end

    def one_letter_trans(input)
      invert.select do |braille, letter|
        return letter if input == braille
      end
    end

    # def encode_to_braille(input)
    #   if input.length == 1
    #     one_letter_encode(input)
    #   else
    #     long_encode(input)
    #   end
    # end#method end
    #
    # def encode_to_braille_wrap(input)
    #   wrap = input.scan(/.{1,80}/)
    #   braille_wrap = wrap.map do |input|
    #     long_encode(input)
    #   end.join("\n")
    # end
    #
    # def one_letter_encode(input)
    #   xyz = []
    #   dictionary.each do |letter, braille|
    #     xyz << braille if letter == input
    #   end
    #   a = []
    #   b = []
    #   c = []
    #   xyz.each do |braille_letter|
    #       a << braille_letter[0]
    #       b << braille_letter[1]
    #       c << braille_letter[2]
    #   end
    #    return "#{a.join}\n#{b.join}\n#{c.join}"
    # end
    #
    # def long_encode(input)
    #   xyz = []
    #   arr = input.chars
    #   arr.each do |letter|
    #     dictionary.select do |k, v|
    #       xyz << v if k == letter
    #     end
    #   end
    #   a = []
    #   b = []
    #   c = []
    #   xyz.each do |braille_letter|
    #       a << braille_letter[0]
    #       b << braille_letter[1]
    #       c << braille_letter[2]
    #   end
    #    return "#{a.join}\n#{b.join}\n#{c.join}"
    # end#method

end
