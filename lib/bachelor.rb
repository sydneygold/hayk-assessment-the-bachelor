require 'json'
require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].find do |person|
    person["status"] == "Winner"
  end["name"]
    .partition(" ")
    .first
end 

def all_seasons(data)
  data.values.flatten
end

def get_contestant_name(data, occupation)
  contestant_name = all_seasons(data).find do |contestant|
  contestant["occupation"] == occupation
    end
  contestant_name["name"]
end


def count_contestants_by_hometown(data, hometown)
  all_seasons(data).reduce(0) do |sum, contestant|
    if contestant["hometown"] == hometown
      sum + 1 
    else 
      sum
    end
  end
end

def get_occupation(data, hometown)
  contestant_name = all_seasons(data).find do |contestant|
    contestant["hometown"] == hometown
  end
  contestant_name["occupation"]
end

def get_average_age_for_season(data, season)
  average = data[season].reduce(0) do |sum, contestant|
    sum += contestant["age"].to_f
  end / data[season].length
  average.round
  #binding.pry
end
