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
    expect(key.random_key.length == 5).to eq(true)
  end

  it 'can return the current key' do
    key = Key.new

    manual_key = "02513"
    key.current_key = manual_key
    expect(key.current_key).to eq("02513")

    random_key = key.generate_key
    key.current_key = random_key
    expect(key.current_key).to be_a(String)
    expect(key.current_key.length == 5).to eq(true)
  end

  it 'can assign A B C D keys' do
    key = Key.new

    manual_key = "02513"
    key.current_key = manual_key
    expect(key.assign_keys).to eq(["02", "25", "51", "13"])
    expect(key.assign_keys.length).to eq(4)

    random_key = key.generate_key
    key.current_key = random_key
    expect(key.assign_keys).to be_a(Array)
    expect(key.assign_keys.length).to eq(4)
  end

end
