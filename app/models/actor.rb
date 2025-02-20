# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  validates(:name, presence: true)
  
  has_many(:characters, class_name: "Character", foreign_key: "actor_id")
  

  # def characters
  #   return Character.where({ :actor_id => self.id })
  # end

  has_many(:filmography, through: "characters", source: "movie")

  # def filmography
  #   # get movie_ids from characters
  #   movie_ids = characters.pluck(:movie_id)

  #   # return list of movies the actor has been in
  #   return Movie.where({ :id => movie_ids })
  # end
end
