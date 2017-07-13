module ApplicationHelper
	def followed_by(user)
		count = 0
		User.all.each do |u|
			if u.following.include?(user.id)
				count += 1
			end
		end
		return count
	end
end
