require 'pry'

class BasketballCLI

  def initialize 
    @players = PlayerScrape.new.call #this will get the players in array for
    puts "Welcome to the USA BASKETBALL TEAM"
    command = nil
    while command != "exit"
      puts "Please type list, show, exit to see more info"
      command = gets.strip
      case command
      when "list"
        list
      when "show"
        show
      end 
    end
  end

  def list  
    @players.each.with_index(1) do |player,i|
    puts "#{i}. #{player.name}"
    end
  end

  def show
    puts "Enter the player name"
    player_name = gets.strip
    player = @players.find do |player|
             player.name == player_name
             end
    binding.pry
    if player.height
      puts "Player name: #{player.name}"
      puts "Player position: #{player.position}"
      puts "Player height: #{player.height}"
      puts "Player weight: #{player.weight}"
      puts "Player birth: #{player.birth}"
      puts "Player team: #{player.team}"
      puts "Player college: #{player.college}"
      puts "Player hometown: #{player.hometown}"
    else
      puts "Player name: #{player.name}"
      puts "Player position: #{player.position}"
    end
  end  
end