class Soundscape < ApplicationRecord
  acts_as_taggable_on :trends, :keywords
end
