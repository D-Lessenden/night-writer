class FileReader

  def read
    filename = ARGV[0].chomp
    File.read(filename)
    # #need to throw a downcase on this
    # File.open("test_file.txt").each do |line|
    #   puts line
    # end
  end

end
