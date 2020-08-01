class NightWriter
#attr_reader :file_reader

  def initialize
    @reader = FileReader.new
    @encode = Encode.new
  end

  def read
    @reader.read
  end

  def encode(input)
    #@encode.encode_to_braille(input)
    @encode.encode_to_braille_wrap(input)
  end

  def encode_file_to_braille
    plain = read
    braille = encode(plain)
    File.open(ARGV[1], "w") do |file|
      file.write braille
    end
  end

  # def encode_to_braille(input)
  #
  # end

end
