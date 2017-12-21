class ReviewsController < ApplicationController
   before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    
     @review.user = current_user
    if @review.save

    redirect_to movie_path(@movie)

   end
  end
 
  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = @movie.comments.find(params[:id])
    @review.destroy
    redirect_to movie _path(@movie)
  end
 
  private
    def review_params
      params.require(:review).permit(:body,:user_id )
    end


end
