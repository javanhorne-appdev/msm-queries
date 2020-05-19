class MoviesController < ApplicationController
  def tdk
    @tdk_class = Movie.where({ :title => "The Dark Knight" })
    @tdk = @tdk_class[0]
    @tdk_year = @tdk.year
    @days_ago = (Time.now.year - @tdk_year) * 365
    render({ :template => "movie_templates/dk.html.erb" })
  end
  
  def before2k
    @movies_pre2k = Movie.where( "year < ?", 2000 )

    render({ :template => "movie_templates/pre2000.html.erb" })
  end
end
