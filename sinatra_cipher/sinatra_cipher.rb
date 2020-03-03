require "sinatra"
require "sinatra/reloader"
require "erb"
require_relative "caesar_cipher.rb"

enable :sessions

get "/" do
    erb :cipher
end

get "/cipher" do
    @message = session.delete(:message)
    erb :cipher, :locals => {:message => @message}
end

post "/cipher" do
    @word = params["word"]
    @shift = params["shift"]
    @cipher = Cipher.new(@word, @shift).cipher
    session[:message] = "Your encripted word is #{@cipher}"
    redirect "/cipher"
end
