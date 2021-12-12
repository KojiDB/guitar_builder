class Guitar < ApplicationRecord
  with_options presence: true do
    validates :guitar_name
    validates :guitar_type_id, numericality: { other_than: 1 }
    validates :strings_number_id, numericality: { other_than: 1 }
    validates :price, numericality: { only_integer: true, with: /\A[0-9]+\z/ }
    validates :features
    validates :builder_id
    validates :images
  end

  belongs_to :builder
  has_one_attached :images
  belongs_to :guitar_type_id
  belongs_to :strings_number_id
  has_many :comments
end
