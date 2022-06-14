require './lib/enigma'
require './lib/key'
require './lib/offset'

enigma = Enigma.new
message_text = ARGV[0]
encrypted_text = ARGV[1]

message = File.new(message_text).read

File.open(encrypted_text, "w") do |text_file|
  enigma.encrypt(message) # reads what is inside message text and passes through to enigma.rb
  text_file.puts enigma.encrypted_hash[:encryption] # writes encrypted message to message text file
  puts "Created #{encrypted_text} with the key #{enigma.encrypted_hash[:key]} and date #{enigma.encrypted_hash[:date]}."
end
# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
