class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :profile]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.search(params[:term])
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  def profile
    :authenticate_user
    @movies = Movie.where(user_id: current_user.id)
  end

  # GET /movies/new
  def new
    :authenticate_user
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    :authenticate_user
  end

  # POST /movies
  # POST /movies.json
  def create
    :authenticate_user
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    :authenticate_user
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    authorize @movie
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :year, :genre, :director, :duration, :description, :image, :user_id, :term)
    end
end
