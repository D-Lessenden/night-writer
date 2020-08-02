require './lib/night_writer'
require './lib/file_reader'
require './lib/encode'

@nightwriter = NightWriter.new
plain = ARGV[0]
braille = ARGV[1]
puts ARGV.inspect
puts "Created '#{braille}' containing #{File.read(plain).length} characters"
File.write(braille, File.read(plain)) #woop woop!
@nightwriter.encode_file_to_braille
