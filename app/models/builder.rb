class Builder < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :brand_name
    validates :builder_email
    validates :builder_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :area
    validates :city
    validates :introduce
    validates :price_zone
    validates :phone
    validates :private_order_id, numericality: { other_than: 1 }
    validates :images
  end

  has_many :guitars
  has_many :comments
end
