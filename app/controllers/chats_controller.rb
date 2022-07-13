class ChatsController < ApplicationController

def show
@chats = Chat.all
end

def index
@chats = Chat.all
end

end