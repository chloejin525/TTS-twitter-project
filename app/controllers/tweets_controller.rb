class TweetsController < ApplicationController
  include TweetsHelper

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :home]

  def home
    @tweet = Tweet.new
    
    @tweets = Tweet.all

    if @tweets.length < 5 
      @tweets_today = @tweets.sample(@tweets.length)
    else 
      @tweets_today = @tweets.sort_by(&:created_at).reverse!.take(5)
    end

    @following_tweets = [ ]
    #@following_tweets = Tweet.where(current_user.following.include?(user_id))

    Tweet.all.each do |tweet|
      #current_user.following => an array of user ids
      if current_user 
        if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
          @following_tweets.push(tweet)
        end
      end
    end

    @following_tweets = @following_tweets.reverse
    
  end

  def explore
    @tweets = Tweet.all

    if @tweets.length < 5 
      @tweets_today = @tweets.sample(@tweets.length)
    else 
      @tweets_today = @tweets.sort_by(&:created_at).reverse!.take(5)
    end
  end


  # GET /tweets
  # GET /tweets.json
  def index
   
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.create(tweet_params)

    @tweet = get_tagged(@tweet)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to home_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:message, :user_id, :link)
    end
end
