class PostingsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_posting, except: [:index, :new, :create]

  def index
    @postings = Posting.all
  end

  def show

  end

  def new
    @posting = Posting.new
    # @posting.post_comments.new
    # @posting.post_comments.save
  end

  def create
    @posting = current_user.postings.new posting_params
    @posting.post_comments.first.user_id = current_user.id

    if @posting.save
      redirect_to @posting
    else
      render action: :new
    end
  end

private

    def set_posting
      @posting = Posting.find(params[:id])
    end

    def posting_params
      params.require(:posting).permit(:title, post_comments_attributes: [:body])
    end
end
