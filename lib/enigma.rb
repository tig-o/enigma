class Enigma

  attr_reader :encrypted_hash
  
  def initialize
    @key = Key.new
    @offset = Offset.new
    @encrypted_hash = Hash.new

  end

  def encrypt(message, key = @key.generate_key, date = @offset.todays_date)
    @key.current_key = key
    keys = @key.assign_keys
    # keys = @keys.create_keys(key) # need to refactor key class try and implement this
    offsets = @offset.create_offsets(date)

    keys_and_offsets = [keys.map(&:to_i), offsets.map(&:to_i)] # throws all abcd keys and offsets into one array
    shifts = keys_and_offsets.transpose.map(&:sum) # at a glance, this gets the sum of each key and offset
    alphabet = ("a".."z").to_a << " "

    encrypted_message = message.chars.map.with_index do |letter, index| # this took me 7 hours to write...
      rotated_alphabet = alphabet.rotate(shifts.rotate(index).first)
      letter_position = letter.bytes.join.to_i - 97
      rotated_alphabet[letter_position]
    end

    encrypted_message = encrypted_message.map { |x| x == nil ? " " : x } # replaces nil in array with a space

    @encrypted_hash = {
      encryption: encrypted_message.join,
      key: key,
      date: date
    }
  end
end
