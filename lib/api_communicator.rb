require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  # make the web request
  films = nil
  films_array = []

  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)

  response_hash["results"][0..82].each do |character_list|
       if character_list["name"] == character_name
        films = character_list["films"]
       end
    end
    films.each do |api|  
    films_string = RestClient.get(api)
    films_hash = JSON.parse(films_string)
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

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
