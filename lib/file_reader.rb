class FileReader

  def read
    filename = ARGV[0]
    File.read(filename)
    # File.open("test_file.txt").each do |line|
    #   puts line
    # end
  end

end
