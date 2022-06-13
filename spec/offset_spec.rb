require './lib/enigma'
require './lib/offset'

RSpec.describe Offset do
  it 'exists' do
    offset = Offset.new
    expect(offset).to be_a(Offset)
  end

  it 'can return a manually entered DDMMYY date' do
    offset = Offset.new
    offset.manual_date = "032592"
    expect(offset.manual_date).to eq("032592")
  end

  it 'can return todays date' do
    offset = Offset.new

    offset.todays_date = Date.today.to_s
    expect(offset.todays_date).to eq(Date.today.to_s)
    expect(offset.todays_date.length).to eq(10)
    expect(offset.todays_date.include?('-')).to eq(true)
  end

  it 'can return todays DDMMYY date' do
    offset = Offset.new

    offset.format_date
    expect(offset.todays_date).to eq(Date.today.strftime('%m%d%y'))
    expect(offset.todays_date).to be_a(String)
    expect(offset.todays_date.length).to eq(6)
    expect(offset.todays_date.include?('-')).to eq(false)
  end
end
