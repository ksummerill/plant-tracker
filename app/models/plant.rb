class Plant < ActiveRecord::Base
  belongs_to :gardener
  belongs_to :category
  validates :name, :amount_of_sun, :water_frequency, presence: true
end
