class Key
  attr_accessor :manual_key,
                :random_key,
                :current_key

  def initialize
    @manual_key = String.new
    @random_key = String.new
    @current_key = String.new
    @keys_array = Array.new
  end

  def generate_key
    @random_key = "0" + rand().to_s[2..5]
  end

  def assign_keys
    a_key = current_key[0] + current_key[1]
    b_key = current_key[1] + current_key[2]
    c_key = current_key[2] + current_key[3]
    d_key = current_key[3] + current_key[4]
    @keys_array = [a_key, b_key, c_key, d_key]
  end
end
