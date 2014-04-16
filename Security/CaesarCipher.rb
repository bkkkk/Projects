#!/usr/bin/ruby

class Caeser
  def initialize(shift, alphabet = ('a'..'z').to_a.join)
    chars = alphabet.chars.to_a
    @decrypted = Hash[chars.zip(chars.rotate(shift))]
    @encrypted = Hash[chars.zip(chars.rotate(-shift))]
  end

  def encrypt(message)
    @encrypted.values_at(*message.chars).join
  end

  def decrypt(message)
    @decrypted.values_at(*message.chars).join
  end
end

if __FILE__ == $0
  c = Caeser.new(10)
  
  message = "this is a secret"
  puts "Encrypting the following message :: #{message}"

  encrypted = c.encrypt(message);
  puts "The encrypted message :: #{encrypted}"
  
  decrypted = c.decrypt(encrypted);
  puts "The decrypted message :: #{decrypted}"
end
