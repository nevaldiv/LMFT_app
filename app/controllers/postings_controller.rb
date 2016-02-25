class PostingsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_postings, except: [:index, :new, :create]

  def index
    @postings = Posting.all
  end

  def show

  end

  def new
    @posting = Posting.new
    @posting.post_comments.new
  end

  def create

  end


private
  def set_posting
    @posting = Posting.find(params[:id])
  end


end
