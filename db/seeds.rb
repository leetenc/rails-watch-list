# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "rest-client"

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

api_url = 'https://api.themoviedb.org/3/movie/popular?api_key=76c90886c7cc5c25fd919ee293f1f8af'

Movie.destroy_all

response = RestClient.get api_url

JSON.parse(response)['results'][0...15].each do |item|
  # => each  is an `Array` of `Hashes`.
  #detail = JSON.parse(RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{item}.json"))
  # post = Post.new(
  #   url: detail["url"],
  #   title: detail["title"],
  #   votes: detail["score"]
  # )
  # post.save!

  Movie.create(
    title: item['title'],
    overview: item['overview'],
    poster_url: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/#{item['poster_path']}",
    rating: item['vote_average']
  )
end
