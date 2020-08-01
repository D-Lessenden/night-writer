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

#it is probably not ok to have this much happening in a runner, ask billy
#should dictionary be another class?
#how should i conduct testing. especially line 10. should that be a method?
#is my overall structure and file tree intuitive and easy to read

# gets chomp asking to encode or decode 
