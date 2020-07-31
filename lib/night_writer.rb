class NightWriter
attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def encode_file_to_braille
    plain = reader.read
    braille = encode_to_braille(plain)
  end

  def encode_to_braille(input)

  end


  # when command ran, takes the message file, translates it, and puts it into braille file.
end


puts ARGV.inspect
puts "Created '#{ARGV.last}' containing #{File.read(ARGV[0]).length} characters"
#File.write(File.read(ARGV[0]), ARGV[1])  this makes a new folder with the name being the txt inside of arg0 and arg 1 being the text inside
File.write(ARGV[1], File.read(ARGV[0]))
