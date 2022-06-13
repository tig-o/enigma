require './lib/enigma'
require './lib/key'

RSpec.describe Key do
  it 'exists' do
    key = Key.new
    expect(key).to be_a(Key)
  end
end
