class EpiccenterController < ApplicationController
  
  #can also use only: [:action_name]	
  before_action :authenticate_user!

  def tweet_tags
    @tag = Tag.find(params[:id])
  end

  def feed
  	@following_tweets = [ ]
    #@following_tweets = Tweet.where(current_user.following.include?(user_id))

    Tweet.all.each do |tweet|
  		#current_user.following => an array of user ids
  		if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
  			@following_tweets.push(tweet)
  		end
  	end
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  	# the id comes in as a string
  	current_user.following.push(params[:id].to_i)
  	# make sure you save
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end
end
