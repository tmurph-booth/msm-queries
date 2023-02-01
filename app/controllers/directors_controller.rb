class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
    
    render({:template => "director_templates/index.html.erb"})
  end

  def eldest
    @OldestDirector = Director.where.not(:dob => nil).order({ :dob => :asc}).at(0)

    render({:template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @YoungestDirector = Director.where.not(:dob => nil).order({ :dob => :desc}).at(0)

    render({:template => "director_templates/youngest.html.erb"})
  end

  def director_details
    directorID = params.fetch("an_id")
    @directorDetails = Director.where({ :id => directorID}).at(0)
    @filmography = Movie.where({ :director_id => directorID})

    render({:template => "director_templates/show.html.erb"})
  end
end
