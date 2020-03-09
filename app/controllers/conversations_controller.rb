class ConversationsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new]

# using mailbox method in conversation for current user
    def index
        @conversations = current_user.mailbox.conversations
    end

    # find the params id for current user
    def show
        @conversation = current_user.mailbox.conversations.find(params[:id])
    end

    # removing the current user from the list of users, as current user
    # would not chat with himself
    def new   
        @recipients = User.all - [current_user]
    end


    # creating and sending message with all the parameters
    def create
        recipient = User.find(params[:user_id])
        receipt   = current_user.send_message(recipient, params[:body], params[:subject])
        redirect_to conversation_path(receipt.conversation)
    end

    
end
