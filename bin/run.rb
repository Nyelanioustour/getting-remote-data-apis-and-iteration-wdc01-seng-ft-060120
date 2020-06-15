#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome()
loop do
user_input = get_user_option()
if user_input == "1"
    character = get_character_from_user()
    movies_api = get_movies_api_from_character(character)
    if movies_api == nil
        puts "Character not found!"
      else
    films_array = get_character_films(movies_api)
    print_movies(films_array)
    puts "\n"
      end

elsif user_input == "2" 
    movie = get_movie_from_user()
    characters_api = get_character_api_from_movie(movie)
    if characters_api == nil
        puts "Movie not found!"
    else
    characters_array = get_movie_characters(characters_api)
    print_characters(characters_array)
    puts "\n"
      end

elsif  user_input == "3"
    break
else puts "Please choose from available options!"
end
end


