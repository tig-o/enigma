require './lib/enigma'
require './lib/offset'

RSpec.describe Offset do
  it 'exists' do
    offset = Offset.new
    expect(offset).to be_a(Offset)
  end
end
