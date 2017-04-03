require 'pry'

def game_hash
    game = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                :"Alan Anderson" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                :"Reggie Evans" => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                },
                :"Brook Lopez" => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                :"Mason Plumlee" => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                :"Jason Terry" => {
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                :"Jeff Adrien" => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                :"Bismak Biyombo" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                :"DeSagna Diop" => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                :"Ben Gordon" => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                :"Brendan Haywood" => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12
                },
            }
        }
    }

    game

end

def home_team_name
    game_hash[:home][:team_name]
end

def good_practices
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|

        end
    end
end

def num_points_scored(name)
    # binding.pry
    if game_hash[:home][:players].keys().include? name.to_sym
        game_hash[:home][:players][name.to_sym][:points]
    elsif game_hash[:away][:players].keys().include? name.to_sym
        game_hash[:away][:players][name.to_sym][:points]
    end
end

def shoe_size(name)

    if game_hash[:home][:players].keys().include? name.to_sym
        game_hash[:home][:players][name.to_sym][:shoe]
    elsif game_hash[:away][:players].keys().include? name.to_sym
        game_hash[:away][:players][name.to_sym][:shoe]
    end
end


def team_colors(team_name)
    if game_hash[:home][:team_name] == team_name
        game_hash[:home][:colors]
    else
        game_hash[:away][:colors]
    end
end

def team_names
    teams = []
    teams.push(game_hash[:home][:team_name])
    teams.push(game_hash[:away][:team_name])
    teams
end

def player_numbers(team_name)
    numbers = []
    if game_hash[:home][:team_name] == team_name
        game_hash[:home][:players].each do |player, stats|
            stats.each do |attribute, data|
                if attribute == :number
                    numbers.push(data)
                end
            end
        end
    else
        game_hash[:away][:players].each do |players, stats|
            stats.each do |attribute, data|
                if attribute == :number
                    numbers.push(data)
                end
            end
        end
    end
numbers
end

def player_stats(name)
    if game_hash[:home][:players].keys().include? name.to_sym
        game_hash[:home][:players][name.to_sym]
    else
        game_hash[:away][:players][name.to_sym]
    end
end

def big_shoe_rebounds
player_shoes = []
homeNames = game_hash[:home][:players].keys()
awayNames = game_hash[:away][:players].keys()

    homeNames.each do |name|
        shoe_size = game_hash[:home][:players][name][:shoe]
        newHash = {name => shoe_size}
        player_shoes << newHash
    end

    awayNames.each do |name|
        shoe_size = game_hash[:away][:players][name][:shoe]
        newHash = {name => shoe_size}
        player_shoes << newHash
    end

    player_shoes = player_shoes.reduce Hash.new, :merge
    max = player_shoes.values.max
    biggest_shoe = player_shoes.select {|k, v| v == max}.keys.join(" ")

     #BIGGEST SHOE IS NOW FOUND
     if game_hash[:home][:players].include? biggest_shoe.to_sym
         game_hash[:home][:players][biggest_shoe.to_sym][:rebounds]
     else
         game_hash[:away][:players][biggest_shoe.to_sym][:rebounds]
     end
     #
    #  binding.pry

end

def most_points_scored

    player_points= []
    homeNames = game_hash[:home][:players].keys()
    awayNames = game_hash[:away][:players].keys()

        homeNames.each do |name|
            points_scored = game_hash[:home][:players][name][:points]
            newHash = {name => points_scored}
            player_points << newHash
        end

        awayNames.each do |name|
            points_scored = game_hash[:away][:players][name][:points]
            newHash = {name => points_scored}
            player_points << newHash
        end

        player_points = player_points.reduce Hash.new, :merge
        max = player_points.values.max
        most_points = player_points.key(max)

        most_points.to_s

end

def winning_team
    brook = []
    charl = []

  game_hash[:home][:players].each do |player, stats|
    brook << stats[:points]
  end
  game_hash[:away][:players].each do |player, stats|
    charl << stats[:points]
  end

  brook = brook.inject(:+)
  charl = charl.inject(:+)
  # binding.pry

  if brook > charl
      game_hash[:home][:team_name]
  else
      game_hash[:away][:team_name]
  end

end

def player_with_longest_name
    names = []
    namesArray = []

    game_hash[:home][:players].each do |player, stats|
    names << player
  end
  game_hash[:away][:players].each do |player, stats|
    names << player
  end

  names.each do |name|
    namesArray << name.to_s.split("").length
  end

  names[namesArray.index(namesArray.max)].to_s

end

def long_name_steals_a_ton?

    mostSteals = []
    game_hash[:home][:players].each do |players, stat|
        mostSteals << stat[:steals]
    end
    game_hash[:away][:players].each do |players, stat|
        mostSteals << stat[:steals]
    end

    stealCheck = mostSteals.max



    playerSteals =
    if game_hash.dig(:home, :players, player_with_longest_name.to_sym ,:steals) == nil
        game_hash.dig(:away, :players,player_with_longest_name.to_sym ,:steals)
    else
      game_hash.dig(:home, :players,player_with_longest_name.to_sym ,:steals)
    end

    return true if stealCheck == playerSteals

end

# long_name_steals_a_ton
