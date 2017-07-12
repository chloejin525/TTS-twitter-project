module TweetsHelper
	def get_tagged(tweet)
		message_arr = tweet.message.split
	    message_arr.each_with_index do |word, index|
	      if word[0] == "#"
	        if Tag.pluck(:phrase).include?(word)
	          #Tag exists 
	          tag = Tag.find_by(phrase: word)
	        else
	          #create a new tag
	          tag = Tag.create(phrase: word)
	        end
	        #create the tweet tag
	        tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
	        message_arr[index] = "<a href='/tweet_tags?id=#{tag.id}'>#{word}</a>"
	      end
	    end
		
		# to update the tweet so that the tag of the tweet has a link!
		tweet.message = message_arr.join(" ")
		return tweet
	end
end
