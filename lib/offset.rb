class Offset
  attr_accessor :manual_date,
                :todays_date,
                :calculated_offset,
                :offset_array

  def initialize
    @manual_date = String.new
    @todays_date = Date.today.strftime('%m%d%y')
    @current_date = String.new
    @calculated_offset = Array.new
    @offset_array = Array.new
  end

  def calculate_offset(date)
    @calculated_offset = (date.to_i * date.to_i).to_s[6..-1].chars
  end

  def assign_offsets
    a_offset = @calculated_offset[0]
    b_offset = @calculated_offset[1]
    c_offset = @calculated_offset[2]
    d_offset = @calculated_offset[3]
    @offset_array = [a_offset, b_offset, c_offset, d_offset]
  end
end
