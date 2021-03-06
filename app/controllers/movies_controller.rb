class MoviesController < ApplicationController
   before_action :authenticate_admin_user!,only: [:create]
   before_action :authenticate_user!,only: [:upvote,:downvote]
   before_action :set_movie, only: [:show, :edit, :update, :destroy,:downvote,:upvote]

  def index
    search=params[:search]    
    if search
       capital_search = search.capitalize
       downcase_search = search.downcase
       upcase_search = search.upcase
       title_search = search.titleize
     @movies = Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('rating ASC')
     @ratings = Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('rating ASC')

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

    if params[:view] ==  "automatic"

      @mv = OtherServieceCall.new.api_call(params[:movie][:title])
      if @mv == true
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
   
 
    if @movie.update(movie_params)
     redirect_to @movie
    else
      render 'edit'
    end
  end
  
  
  def destroy
    
    @movie.destroy
   
    redirect_to movies_path
  end
 
  def upvote
    
    @movie.upvote_by current_user
     redirect_back(fallback_location: root_path)
  end
   def downvote
    
    @movie.downvote_from current_user
     redirect_back(fallback_location: root_path)
  end
  private 

    def set_movie
     @movie = Movie.find(params[:id])
    end

   
    def movie_params
       params.require(:movie).permit(:title,:plot,:genr,:rating,:cast,:image,:year,:website)
    end   

end
