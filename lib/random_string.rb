class RandomString
  AVAILABLE_CHARS = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten

  def self.generate(length)
    (0..length-1).map{ AVAILABLE_CHARS[rand(AVAILABLE_CHARS.length)] }.join
  end
end