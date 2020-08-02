class NightReader

  def initialize
    @reader = FileReader.new
    @encode = ReverseEncode.new
  end

  def read
    @reader.read

  end

  def encode(input)
    @encode.long_translate(input)
  end

  def encode_file_to_english
    braille = read
    plain = encode(braille)
    File.open(ARGV[1], "w") do |file|
      file.write plain
    end
  end
end
