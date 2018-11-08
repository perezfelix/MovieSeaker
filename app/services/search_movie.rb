class SearchMovie
	require 'dotenv/load'
	require 'themoviedb'
	def initialize(string)	
		@request = string
	end
	def auth
		Tmdb::Api.key(ENV['KEY_MOVIE'])
	end
	def perform
		auth
		search
	end
	def search
		@search = Tmdb::Search.new
		@search.resource("movie")
  		@search.query(@request) 
		@hash = @search.fetch
		@array_cleaned = []
		  @hash.each { |movie|
		      hash_movie = {}
		      hash_movie["id"] = movie["id"]
		      hash_movie["title"] = movie["title"]
		      credit = Tmdb::Movie.credits(movie["id"])
		      if !credit.empty?
		        if !credit["crew"].empty?
		          if credit["crew"][0]["name"]
		            director = credit["crew"][0]["name"]
		          end
		        end
		      else 
		      director = "Aucun réalisateur connu"
		      end
		      hash_movie["director"] = director
		      hash_movie["date"] = movie["release_date"]
		      hash_movie["poster"] = movie["poster_path"]
		      @array_cleaned << hash_movie
		    }
		    @array_cleaned
		  end
end