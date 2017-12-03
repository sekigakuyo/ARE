class Generate
  attr_accessor :data
  def initialize(filename)
    @file_name = filename
    @data = []
    @sec_num = 9
    @sp_num = 26
    self.control
  end

  def control
    self.data_frame_make
    self.data_make
    self.data_write
  end

  def data_frame_make
    for i in 0..@sp_num do
      @data[i] = Array.new(@sec_num,0)
    end
  end

  def data_make
    l = Random.new(1)
    i = 0
    @data.each do |row|
      i += 1
      k = 0
      row.each do |col|
        @data[i-1][k] = 1 if rand() <= rand()
        k += 1
      end
    end
  end

  def data_write
    io = File.open("#{@file_name}","w")
    x = Array.new(@sec_num+1){|i|
      i
    }

    x[0] = nil
    x.each do |i|
      io.write(i)
      break if i == @sec_num
      io.write(",")
    end

    i = 1
    @data.each do |line|
      io.write("\n#{i}")
      line.each do |value|
        io.write(",")
        io.write(value)
      end
      i += 1
    end
    
    io.close
  end

  
end

k = Generate.new("randam.txt")

=begin
k.data.each do |a|
  print a
  puts
end
=end
