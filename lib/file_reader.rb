class FileReader

  def read(filename)
    #filename = ARGV[0]
    File.read(filename).chomp
    # #need to throw a downcase on this
    # File.open("test_file.txt").each do |line|
    #   puts line
    # end
  end

end
