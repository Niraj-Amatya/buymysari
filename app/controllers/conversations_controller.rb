class ConversationsController < ApplicationController
    def index
        @conversations = current_user.mailbox.conversations
    end

    def show
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end

    def new

    end

    def create

    end
    
end
