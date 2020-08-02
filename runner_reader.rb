require './lib/night_reader'
require './lib/file_reader'
require './lib/reverse_encode'

@nightreader = NightReader.new
braille = ARGV[0]
plain = ARGV[1]
puts ARGV.inspect
puts "Created '#{plain}' containing #{File.read(braille).length} characters"
File.write(plain, File.read(braille)) #woop woop!
@nightreader.encode_file_to_english
