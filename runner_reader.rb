require './lib/night_reader'
require './lib/file_reader'
#require './lib/encode'

@nightreader = NightReader.new
# plain = ARGV[0]
# braille = ARGV[1]
#the above is from night writer will need to reverse these 
puts ARGV.inspect
puts "Created '#{ARGV[1]}' containing #{File.read(ARGV[0]).length} characters"
File.write(ARGV[1], File.read(ARGV[0])) #woop woop!
#@nightwriter.encode_file_to_braille
