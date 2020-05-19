class DirectorsController < ApplicationController

  def last
    @directors = Director.all.where.not({ :dob => nil }).order({ :dob => :desc })

    render ({ :template => "director_templates/youngest.html.erb" })
  end

  def under_55

    @under55 = Director.all.where( "dob > ?", 55.years.ago)

    render ({ :template => "director_templates/under_55.html.erb"})
  end

  def francis
    ffc_id = Director.where({ :name => "Francis Ford Coppola"})[0].id
    @francis = Movie.where({ :director_id => ffc_id})

    render ({ :template => "director_templates/coppola.html.erb"})
  end

  def morgan
    morgan_id = Actor.where({ :name => "Morgan Freeman"})[0].id
    @morgan_characters = Character.where({ :actor_id => morgan_id })

    @morgan_film_ids = @morgan_characters.pluck(:movie_id)
    @morgan_films = Movie.where({:id => @morgan_film_ids})
    render ({ :template => "director_templates/freeman.html.erb"})
  end
end