class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    
    matching_records = Director.where({:id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def junior
    @youngest_directors = Director.where.not({ :dob => nil }).order({ :dob => :desc })

    @the_youngest_director = @youngest_directors.at(0)

      render({ :template => "director_templates/junior"})
  end 

  def senior
    @oldest_directors = Director.where.not({ :dob => nil }).order({ :dob => :asc })

      render({ :template => "director_templates/senior"})
  end
end
