class Encode

def encode_to_braille(input)
  if input.length == 1
    xyz = []
    dictionary.each do |letter, braille|
      xyz << braille if letter == input
    end
    xyz.each do |x|
      x.each do |y|
        puts y #this prints more or less what i need
        # but I dont know how to return it orrectly for test 
    end
    end
  else
    #could break this down to two methods
    xyz = []
    arr = input.chars
    arr.each do |letter|
      dictionary.select do |k, v|
        xyz << v if k == letter
      end
    end
    xyz #this makes an array of arrays, may need to reformat this
  end

end#method end

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
      "q" => ["0.", "..", ".."],
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

  end
