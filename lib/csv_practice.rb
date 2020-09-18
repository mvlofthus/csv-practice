require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)

  all_athletes = CSV.read(filename, headers: true).map { |row| row.to_h}

  required_fields = ['ID','Name', 'Height', 'Team', 'Year', 'City', 'Sport', 'Event', 'Medal']

  all_athletes.each do |athlete_hash|
    athlete_hash.select! {|category, value| required_fields.include?(category)}
  end

  #ap all_athletes
  return all_athletes

end

#specific_columns = get_all_olympic_athletes('../data/athlete_events.csv')

def total_medals_per_team(olympic_data)
  medal_count = Hash.new(0)
  olympic_data.each do|athlete|
    if athlete["Medal"] != "NA"
      medal_count[athlete["Team"]] += 1
    end
  end

  #puts "#########"
  #ap medal_count
end

#total_medals_per_team(specific_columns)

def get_all_gold_medalists(olympic_data)
end
