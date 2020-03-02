require "sinatra"
require "erb"
require "caesar_cipher"

get "/" do
    @cipher = Cipher.new(params["word"])
    
    erb :cipher
end

post "/" do
    
end