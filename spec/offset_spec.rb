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

    expect(offset.todays_date).to eq(Date.today.strftime('%m%d%y'))
    expect(offset.todays_date).to be_a(String)
    expect(offset.todays_date.length).to eq(6)
    expect(offset.todays_date.include?('-')).to eq(false)
  end

  it 'can calculate a starting offset' do
    offset = Offset.new

    manual_date = "032592"
    expect(manual_date.to_i * manual_date.to_i).to eq(1062238464)

    squared_num = 1062238464
    expect(squared_num.to_s).to eq("1062238464")
    expect(squared_num.to_s[6..-1]).to eq("8464")

    offset.calculate_offset(manual_date)
    expect(offset.calculated_offset).to be_a(Array)
    expect(offset.calculated_offset.length).to eq(4)
    expect(offset.calculated_offset).to eq(["8", "4", "6", "4"])
  end

  it 'can assign A B C D offsets' do
    offset = Offset.new
    manual_date = "032592"
    offset.calculate_offset(manual_date)
    expect(offset.assign_offsets).to eq(["8", "4", "6", "4"])
    expect(offset.offset_array).to eq(["8", "4", "6", "4"])

    todays_date = Date.today.strftime('%m%d%y')
    offset.calculate_offset(todays_date)
    expect(offset.assign_offsets).to be_a(Array)
    expect(offset.offset_array).to be_a(Array)
  end
end
