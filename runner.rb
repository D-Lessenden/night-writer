require './lib/night_writer'
require './lib/file_reader'
require './lib/encode'



@nightwriter = NightWriter.new
puts ARGV.inspect
puts "Created '#{ARGV.last}' containing #{File.read(ARGV[0]).length} characters"
File.write(ARGV[1], File.read(ARGV[0])) #woop woop!
@nightwriter.encode_file_to_braille
#the above creates a knew file and the text matches exactly that from message
#need to pass in an argument so that braille is actually translated
#probably the methods that beto and nico were using to write over the file
#so first it will be english, a diff method is called and written over
#to braille
