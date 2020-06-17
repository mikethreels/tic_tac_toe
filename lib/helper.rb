module Helper
  def self.get_shape
    shape = gets.chomp
    while shape.size > 5 || shape.size == 0
      print "please enter a string no longer than 5 characters"
      shape = gets.chomp
    end
    shape
  end
end
