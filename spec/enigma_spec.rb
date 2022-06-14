require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    enigma = Enigma.new

    expected =
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with a key and date' do
    enigma = Enigma.new

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it 'can encrypt a message with a key and todays generated date' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")

    expect(encrypted[:encryption]).to be_a(String)
    expect(encrypted[:encryption].length).to eq(11)

    expect(encrypted[:date]).to eq(Date.today.strftime('%m%d%y'))
    expect(encrypted[:date].length).to eq(6)

    expect(encrypted[:key]).to eq("02715")
  end

  it 'can decrypt and encrypted message with a key and todays generated date' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")

    expect(encrypted[:encryption]).to be_a(String)
    expect(encrypted[:date]).to eq(Date.today.strftime('%m%d%y'))
    expect(encrypted[:key]).to eq("02715")
    
    expected = {:date=>"061422", :decryption=>"hello world", :key=>"02715"}
    expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end
end
