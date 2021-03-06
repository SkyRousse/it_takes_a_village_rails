require 'rails_helper'

describe User do
  [:email, :password, :first_name, :last_name].each do |attr|
    it {should validate_presence_of(attr)}
  end
  it { should validate_confirmation_of :password }
  it { should have_many :pets}
end
