require "sinatra"
require "erb"
require "caesar_cipher"

get "/" do
    
    erb :layout
end