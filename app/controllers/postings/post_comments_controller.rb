class Postings::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_posting

  def create
    @post_comment = @posting.post_comments.new post_comment_params
    @post_comment.user = current_user

    if @post_comment.save
      redirect_to posting_path(@posting, anchor: "post_comment_#{@post_comment.id}"), notice: "Successfully posted!"
    else
      redirect_to @posting, alert: "Unable to save your post"
    end
  end

private

    def set_posting
      @posting = Posting.find(params[:posting_id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:body, :user_id)
    end
end
