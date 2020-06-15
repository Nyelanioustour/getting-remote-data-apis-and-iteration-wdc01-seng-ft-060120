def welcome
  # puts out a welcome message here!
  puts "Welcome to the Starwars Internet Movie Database"
end

def get_user_option
  puts "Choose whether you want to search by movie or character name"
  puts "1. Search by character name"
  puts "2. Search by movie name"
  puts "3. Exit"
  user_input = gets.chomp

end

def get_character_from_user
  puts "Please enter a character name to search"
  user_input = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_movie_from_user
  puts "Please enter a movie name to search"
  user_input = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end
