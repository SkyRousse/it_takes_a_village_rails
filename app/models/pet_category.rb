class PetCategory < ApplicationRecord
  has_many :pets
  validates_presence_of :name
  # def self.search(search)
  #   if search
  #     where("name LIKE :search", search: "#{search}")
  #   else
  #     where(nil)
  #   end
  # end
end
