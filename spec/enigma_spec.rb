require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  # it 'can encrypt a message with a key and date' do
  #   enigma = Enigma.new
  #
  #   expected =
  #   {
  #     encryption: "keder ohulw",
  #     key: "02715",
  #     date: "040895"
  #   }
  #
  #   expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  # end
end
