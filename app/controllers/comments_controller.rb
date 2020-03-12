class CommentsController < ApplicationController
  
  # authentication for user for comments: only current user can
  #can create or destroy their comments
  before_action :authenticate_user!, only: [ :create, :destroy]
    # create action for comment
    def create
        @listing = Listing.find(params[:listing_id])
        @comment = @listing.comments.new(comment_params)
        @comment.commenter = "#{current_user.first_name} #{current_user.last_name}"
        @comment.save
        # redirect you to show page of commented listing
        redirect_to listing_path(@listing)
    end

    # DELETE /listings/:listing_id/comments/:id
    def destroy
        @listing = Listing.find(params[:listing_id])
        @comment = @listing.comments.find(params[:id])
        @comment.destroy
        # redirect you to show page of deleted listing
        redirect_to listing_path(@listing)
      end
     
      # private method that is only used within the class and not outside
      private
          # Only allow a list of trusted parameters through.

        def comment_params
          params.require(:comment).permit(:body)
        end

end
