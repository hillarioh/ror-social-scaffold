class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts

    ids = Friendship.posting_friend(current_user.id).pluck(:user_id)
    ids += Friendship.posting_user(current_user.id).pluck(:friend_id)
    ids += [current_user.id]

    @timeline_posts ||= Post.where(user: ids).ordered_by_most_recent.includes(:user)
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
