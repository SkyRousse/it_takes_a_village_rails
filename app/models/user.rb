class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        #  , :confirmable, :lockable
  has_many :pets
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  geocoded_by :street_address
  after_validation :geocode

  before_save :downcase_fields

  def full_address
    [street_address, "Portland", "OR"]
  end

  def downcase_fields
     self.email.downcase!
     self.first_name.downcase!
     self.last_name.downcase!
  end
end
