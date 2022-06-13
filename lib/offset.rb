class Offset
  attr_accessor :manual_date,
                :todays_date

  def initialize
    @manual_date = String.new
    @todays_date = Date.today.to_s
  end
end
