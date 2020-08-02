class ReverseEncode

  def dictionary
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
      braille_array = input.split("\n")
      invert.select do |braille, letter|
           return letter if braille_array == braille
         end
    end

    def to_english(braille_letters)
      english = []
      braille_letters.each do |braille_letter|
        invert.each do |braille, letter|
        english << letter if braille_letter == braille
        end
      end
      english.join
    end

    def long_translate(input)
      braille_words = input.split("\n")
      braille_letters = [braille_words[0].scan(/.{1,2}/), braille_words[1].scan(/.{1,2}/), braille_words[2].scan(/.{1,2}/)].transpose { |top,middle,bottom| [top,middle,bottom]}
      to_english(braille_letters)
    end#method
#add an if statement- if longer than w/e do the code below, if not, do above
    #this works for the long method
  def wrap_translate(input)
    braille_words = input.split("\n")
    first_row = ""; second_row = ""; third_row = ""
    rows = braille_words.length
    calculate_rows_of_braille = rows / 3

    calculate_rows_of_braille.times {
    first_row += (braille_words.shift)
    second_row += (braille_words.shift)
    third_row += (braille_words.shift)
      }

    braille_letters = [first_row.scan(/.{1,2}/), second_row.scan(/.{1,2}/), third_row.scan(/.{1,2}/)].transpose {|top,middle,bottom| [top,middle,bottom]}
    to_english(braille_letters)
  end#method


end
