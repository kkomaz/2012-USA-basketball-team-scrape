require 'pry'

class PlayerScrape

  def scrape_all_urls
    basketball_html = open("http://www.usab.com/mens/national-team/roster.aspx")
    basketball_index = Nokogiri::HTML(basketball_html)

    @urls = basketball_index.search("div.value a").collect do |e|
           e["href"]
           end
  end

  def scrape_players
    #2. For each player url you find, open up that player page
    @urls.collect do |url|
      scrape_player(url)
    end
  end

  def scrape_player(url)
    #3. scrap the indivudal player data off that page
    player_html = open(url)
    player_url = Nokogiri::HTML(player_html)

    player = Player.new

     if player_url.search("div.titleValuePair.hgt div.value span.full").first == nil
        player.name = player_url.search("div.moduleContentMain h2").first.text
        player.position = player_url.search("div.value span.full").first.text
     else
        player.name = player_url.search("div.moduleContentMain h2").first.text
        player.position = player_url.search("div.value span.full").first.text
        player.height = player_url.search("div.titleValuePair.hgt div.value span.full").first.text
        player.weight = player_url.search("div.titleValuePair.wgt div.value span.full").first.text
        player.birth = player_url.search("div.titleValuePair.dob div.value").first.text
        player.team = player_url.search("div.titleValuePair.nbaTeam div.value").first.text
        player.college = player_url.search("div.titleValuePair.collegeTeam div.value").first.text
        player.hometown = player_url.search("div.titleValuePair.homeTown div.value").first.text
      end
    player
  end

  def call
    scrape_all_urls
    scrape_players
  end
end