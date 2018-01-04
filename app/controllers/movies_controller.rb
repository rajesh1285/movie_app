class MoviesController < ApplicationController
   before_action :authenticate_admin_user!,only: [:create]
  

  def index
    if params[:search]
     @movies = Movie.search(params[:search])
     @ratings = Movie.search(params[:search])

     else
      @movies =Movie.all
      @movies = Movie.all.order('count DESC').limit(4)
      @ratings = Movie.all.order('rating DESC').limit(4)
   end
   
  end
  
  def new
    @movie = Movie.new
  end


 def create

    if params[:view] = "automatic"

      @mv = OtherServieceCall.new.api_call(params[:movie][:title])
      if @mv = true
        redirect_to "#{Rails.application.secrets.url}/admin/movies",notice: "movie Successfully Saved"
      else
        redirect_to new_admin_movie_path(view: params[:view]),alert: "Movie Not Found Please verify it."
      end
    else
      @movie =  Movie.new(movie_params)
      if @movie.save
        redirect_to "#{Rails.application.secrets.url}/admin/movies",notice: "movie Successfully Saved"
      else
        redirect_to new_admin_movie_path
      end
    end
  end


  # def create
  #   @movie = Movie.new(movie_params)
   
  #  if @movie.save
  #   redirect_to @movie
  #  else
  #    render 'new'
  #  end
  # end


  def show
    @movie = Movie.find(params[:id])
    View.create(movie_id: @movie.id)
    @genre_same= Movie.where(:genr=> @movie.genr)
    @view = params[:view]  
  end
  

  def detail
    @abc = params[:view]
    @movie = Movie.order('count DESC')
    @rating = Movie.order('rating DESC')
  end
  

  
  def update
    @movie = Movie.find(params[:id])
 
    if @movie.update(movie_params)
     redirect_to @movie
    else
      render 'edit'
    end
  end
  
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
   
    redirect_to movies_path
  end
  def upvote
    @movie = Movie.find(params[:id])
    @movie.upvote_by current_user
     redirect_back(fallback_location: root_path)
  end
   def downvote
    @movie = Movie.find(params[:id])
    @movie.downvote_from current_user
     redirect_back(fallback_location: root_path)
  end

  private 
   
    def movie_params
       params.require(:movie).permit(:title,:plot,:genr,:rating,:cast,:image,:year,:website)
    end   

end
