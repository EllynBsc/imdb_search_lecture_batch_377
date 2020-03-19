class MoviesController < ApplicationController
  #WHERE: basic search AC search: case sensitive
  # def index
  #   if params[:query].present? #returns a boolean
  #     @movies = Movie.where(title: params[:query])
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # WHERE with case insensitive
  #  def index
  #   if params[:query].present?
  #     @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # WHERE SEARCHING THROUGH MULTIPLE COLUMNS OF ONE TABLE
  # def index
  #   if params[:query].present?
  #     sql_query = "title ILIKE :query OR syllabus ILIKE :query" # sql SYNTAX
  #                 #column_name ILIKE :key_name OR column_name ILIKE :key_name
  #     @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end


  #SEARCHING THROUGH MULTIPLE COLUMNS OF MULTIPLE TABLES ASSOCIATED
  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       movies.title ILIKE :query \
  #       OR movies.syllabus ILIKE :query \
  #       OR directors.first_name ILIKE :query \
  #       OR directors.last_name ILIKE :query \
  #     "
  #     @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # SEARCHING MULTIPLE TERMS THROUGH MULTIPLE COLUMNS OF MULTIPLE TABLES
  # type many words, the order of the words should not matter
  # not only one word but many words
  # the order of the words does not matter
  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       movies.title @@ :query \
  #       OR movies.syllabus @@ :query \
  #       OR directors.first_name @@ :query \
  #       OR directors.last_name @@ :query \
  #     "
  #     @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  #   # if i type superman bat , it wont' find anything
  # end




  # PG SEARCH : THROUGH THE COLUMNS OF ONE TABLE

  #   if params[:query].present? #returns a boolean
  #     @movies = Movie.search_by_title_and_syllabus(params[:query])
  #   else
  #     @movies = Movie.all
  #   end
  # end




  # PG SEARCH : THROUGH THE COLUMNS OF TABLES ASSOCIATED:MOVIES & DIRECTORS

  #   if params[:query].present?
  #     @movies = Movie.global_search_for_movies_directors(params[:query])
  #   else
  #     @movies = Movie.all
  #   end
  # end

    # PG SEARCH : THROUGH THE COLUMNS OF TABLES NOT ASSOCIATED: MOVIES & TVSHOWS
  def index
    if params[:query].present?
      @results= PgSearch.multisearch('superman')
      # You get a polymoprhic collection, you should use searchable method to be able to retrieve the info of the records
    else
      @movies = Movie.all
    end
  end
end
