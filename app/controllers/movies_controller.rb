class MoviesController < ApplicationController
  

  def index
  @movies = Movie.all.order('created_at DESC')
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
    @genre_same= Movie.where(:genr=> @movie.genr)
  end
  

  def edit 
  end
  

  def update
  end
  

  def destroy
  end

  private 
    def movie_params
       params.require(:movie).permit(:title,:plot,:genr,:rating,:cast,:image)
    end


end
