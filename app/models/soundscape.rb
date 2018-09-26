class Soundscape < ApplicationRecord
  acts_as_taggable_on :trends, :keywords
  validates :name, :country, :woeid, presence: true
  validate :trends_cannot_be_empty

  def trends_cannot_be_empty
    errors.add(:trend_list, "can't be empty") if self.trend_list.empty? 
  end

end
