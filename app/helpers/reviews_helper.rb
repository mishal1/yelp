module ReviewsHelper

	def star_rating(rating)
		return rating if rating == 'N/A'
    '★' * rating.to_i
	end

end

