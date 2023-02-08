class Cow < ApplicationRecord
  validates :collarId, uniqueness: true
  validates :cowNumber, uniqueness: true
end
