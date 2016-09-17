class Pet < ApplicationRecord
  validates_presence_of :name, :species, :need_help_with
  belongs_to :user
end
