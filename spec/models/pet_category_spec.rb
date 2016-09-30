require 'rails_helper'

describe PetCategory do
  it {should have_many :pets}
  it {should validate_presence_of :name}
end
