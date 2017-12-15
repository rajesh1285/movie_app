class MoviesController < ApplicationController
  

  def index
  @movies = Movie.all
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
       params.require(:movie).permit(:title,:plot,:genr,:rating,:cast,:image)
    end


end
