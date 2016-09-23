require 'rails_helper'

describe Pet do
  [:name, :species, :pet_category_id].each do |attr|
    it {should validate_presence_of(attr)}
  end
  it { should belong_to :user}
end
