class Key
  attr_accessor :manual_key,
                :random_key,
                :current_key

  def initialize
    @manual_key = String.new
    @random_key = String.new
    @current_key = String.new
  end

  def generate_key
    @random_key = "0" + rand().to_s[2..5]
  end

end
