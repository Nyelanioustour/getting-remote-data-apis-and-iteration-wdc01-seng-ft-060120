require 'rest-client'
require 'json'
require 'pry'

def get_movies_api_from_character(character)
  # make the web request
  films_api = nil

  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)

  response_hash["results"][0..82].each do |character_list|
       if character_list["name"] == character
        films_api = character_list["films"]
       end
      end
      return films_api
    end
    
    def get_character_films(films_api)
    films_array = []
    films_api.each do |api|  
    films_string = RestClient.get(api)
    films_hash = JSON.parse(films_string)
    # binding.pry
    films_array << films_hash
  end
  return films_array
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  index = 0
  while index< films.length
  p "#{films[index]["title"]}"
  index+=1
  end
end

def get_character_api_from_movie(movie_name)
  characters_api = nil

  response_string = RestClient.get('http://swapi.dev/api/films')
  response_hash = JSON.parse(response_string)

  response_hash["results"][0..6].each do |movie_list|
       if movie_list["title"] == movie_name
        characters_api = movie_list["characters"]
       end
      end
  return characters_api
end

def get_movie_characters(characters_api)
  characters_array = []
  characters_api.each do |api|  
    films_string = RestClient.get(api)
    films_hash = JSON.parse(films_string)
    characters_array << films_hash
  end
  return characters_array
end
  
def print_characters(characters)
  # some iteration magic and puts out the movies in a nice list
  index = 0
  while index< characters.length
  p "#{characters[index]["name"]}"
  index+=1
  end
end

# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   print_movies(films)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
