module MoviesHelper
	def check_rating(abc)
		if abc == "byrating"
			return "in active"
		end
	end

	def check_view(abc)
		if abc == "byview"
			return "in active"
		end
	end
end
