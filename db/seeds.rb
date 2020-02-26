# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require 'net/https'
# require 'json'

# # key = '5cNcVmjjHLu9wX3X2alybg'
# # secret_key = 'JjnKmmtO9ZCdJyb84c2FPZljGbyuwBVe3TrNHEfEA'
# # http = Net::HTTP.new('theysaidso.com', 443)
# # http.use_ssl = true
# # url = URI("https://www.goodreads.com/search.xml?key=#{key}")
# url = URI('https://quotes.rest/qod.json')
# # puts Net::HTTP.get(url)
# # quote_data = Hash.from_xml(Net::HTTP.get(url))
# quote_data = JSON.parse(Net::HTTP.get(url))
# # response_body = http.request(url).body
# # quote_data = JSON.parse(response_body)

# puts quote_data

# require 'uri'
# require 'net/http'
# require 'openssl'

# url = URI('https://andruxnet-random-famous-quotes.p.rapidapi.com/?cat=famous&count=10')

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request['x-rapidapi-host'] = 'andruxnet-random-famous-quotes.p.rapidapi.com'
# request['x-rapidapi-key'] = '27f9801067msh98b6a13b5665efdp100d7djsnced692c572c6'

# response = http.request(request)
# puts response.read_body

require 'smarter_csv'

Author.destroy_all
Book.destroy_all

csv_file = Rails.root + 'db/books.csv'

books = SmarterCSV.process(csv_file) # Pass the "options" hash as a second argument if CSV was created by Excel.

books.first(30).each do |book|
  # puts book[:title]
  book_name = book[:title]
  rating = book[:average_rating]
  pages = book[:num_pages]

  new_book = Book.create(booktitle: book_name, pages: pages, avgrating: rating)
  puts new_book.inspect
  author_names = book[:authors].split('-')
  puts author_names.inspect
  author_names.each do |author_name|
    new_author = Author.find_or_create_by(name: author_name)
    puts new_author.inspect
    new_book.authors << new_author
  end
  # book_name = book_name.split('-')

  # Book.create(author: author, booktitle: book_name, pages: pages, avgrating: rating)
  # authors = book[:author].split('-') # Still returns the single author if there's only one
  # puts authors
end

puts Book.count.to_s
