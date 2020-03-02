require "sinatra"
require "erb"
require "caesar_cipher"

get "/:word" do
    @cipher = params["word"] 
    
    erb :layout
end

post "/" do
    
end