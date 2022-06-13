class Offset
  attr_accessor :manual_date,
                :todays_date,
                :calculated_offset

  def initialize
    @manual_date = String.new
    @todays_date = Date.today.strftime('%m%d%y')
    @current_date = String.new
    @calculated_offset = Array.new
  end

  def calculate_offset(date)
    @calculated_offset = (date.to_i * date.to_i).to_s[6..-1].chars
  end
end
