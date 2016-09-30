class Pet < ApplicationRecord
  validates_presence_of :name, :species, :pet_category_id
  belongs_to :user
  belongs_to :pet_category
  before_save :downcase_fields

  def downcase_fields
     self.name.downcase!
     self.species.downcase!
     self.age.downcase!
  end
end
