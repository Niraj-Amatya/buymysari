class MessagesController < ApplicationController
    before_action :set_conversation 

    # response to the conversation by current_user which is recepian
    def create
        receipt = current_user.reply_to_conversation(@conversation, params[:body])
        redirect_to conversation_path(receipt.conversation)

    end

    # private method available within this class
    private

    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end
end
