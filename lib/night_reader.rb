class NightReader

  def initialize
    @reader = FileReader.new
    @encode = ReverseEncode.new
  end

  def read
    @reader.read
  end

  def encode(input)
    @encode.wrap_translate(input)
  end

  def encode_file_to_english
    braille = read
    plain = encode(braille)
    @reader.write(plain)
  end

end
