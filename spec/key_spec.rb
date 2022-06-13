require './lib/enigma'
require './lib/key'

RSpec.describe Key do
  it 'exists' do
    key = Key.new
    expect(key).to be_a(Key)
  end

  it 'can return a manually entered key' do
    key = Key.new
    key.manual_key = "02513"
    expect(key.manual_key).to eq("02513")
  end

  it 'can return a randomly generated key' do
    key = Key.new
    key.generate_key
    expect(key.random_key).to be_a(String)
  end

end
