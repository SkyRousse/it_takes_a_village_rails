class PetCategory < ApplicationRecord
  has_many :pets

  def self.search(search)
    if search
      where("name LIKE :search", search: "#{search}")
    else
      where(nil)
    end
  end
end
