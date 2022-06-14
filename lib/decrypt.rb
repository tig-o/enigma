require './lib/enigma'
require './lib/key'
require './lib/offset'

enigma = Enigma.new
encrypted_text = ARGV[0]
decrypted_text = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypted_message = File.new(encrypted_text).read

File.open(decrypted_text, "w") do |text_file|
  enigma.decrypt(encrypted_message, key, date) # encrypted_message reads what is inside encrypted text file and passes through to enigma.rb
  text_file.puts enigma.decrypted_hash[:decryption] # writes decrypted message to decrypted text file
  puts "Created #{decrypted_text} with the key #{key} and date #{date}."
end
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 08131 061422
# Created 'decrypted.txt' with the key 82648 and date 240818
