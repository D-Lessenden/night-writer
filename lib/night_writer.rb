class NightWriter

  def initialize
    @reader = FileReader.new
    @encode = Encode.new
  end

  def read
    @reader.read.downcase.chomp
  end

  def encode(input)
    @encode.encode_to_braille_wrap(input)
  end

  def encode_file_to_braille
    plain = read.downcase.chomp
    braille = encode(plain)
    @reader.write(braille)
  end

end
