class Pet < ApplicationRecord
  validates_presence_of :name, :species, :pet_category_id
  belongs_to :user
end
