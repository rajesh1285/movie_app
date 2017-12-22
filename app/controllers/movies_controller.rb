class MoviesController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index,:show]

  def search
   if params[:search].present?
     @movies = Movie.search(params[:search])
     else
      @movies = Movie.all
   end
  end
  
   

  def index
   @movies = Movie.all.order('count DESC')
   @ratings = Movie.all.order('rating DESC')
  end
  
  def new
    @movie = Movie.new
  end


  def create
    @movie = Movie.new(movie_params)
   
    @movie.save
    redirect_to @movie
  end


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
  

  private 
   
    def movie_params
       params.require(:movie).permit(:title,:plot,:genr,:rating,:cast,:image,:year)
    end   

end
