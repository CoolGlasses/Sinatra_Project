require 'sinatra'
require 'erb'

class Cipher

attr_accessor :cipher

def initialize(message, shift)
  @cipher = caesar_cipher(message, shift.to_i)
end

def caesar_cipher(message, shift)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    final_message = ""
    words = message.split(" ")

    words.each_with_index do |word, i|
      final_word = ""

      word.each_char do |letter|
        if letter == letter.downcase
          capital = false
        else
          capital = true
        end

        if !alphabet.include?(letter.downcase)
          final_word += letter
        else
          current_position = alphabet.index(letter.downcase)
          final_position  = 0

          if shift + current_position > 26
          final_position = (shift + current_position) % 26
          else
          final_position = (shift + current_position)
          end

          if capital == true
            final_word += alphabet[final_position].upcase
          else
            final_word += alphabet[final_position]
          end
        end
      end

      if i == words.length - 1
        final_message += final_word
      else
        final_message += final_word + " "
      end
    end
    return final_message
  end
end
