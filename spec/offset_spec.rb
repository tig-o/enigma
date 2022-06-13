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
end
