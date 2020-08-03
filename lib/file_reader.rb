class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end

  def write(txt)
    File.open(ARGV[1], "w") do |file|
      file.write txt
    end
  end
end
