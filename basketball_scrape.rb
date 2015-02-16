require 'nokogiri'
require 'open-uri'
require 'pry'

def list(players)
  counter = 1
  players.each do |name,link|
    puts "#{counter}. #{name}"
    counter += 1
  end
end

def show(players)
  puts "Please enter player name"
  input = gets.chomp
  player_html = players.select do |name,html|
                  html if name == input
                end.values.join
  player_info(player_html)
end

#scraping player details




end