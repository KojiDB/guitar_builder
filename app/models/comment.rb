class Comment < ApplicationRecord
  with_options presence: true do
    validates :guitar_id
    vslidates :comment
  end
  validates :user_id_or_builder_id, presence: true

  belongs_to :user
  belongs_to :builder
  belongs_to :guitar

  private
  
  def user_id_or_builder_id
    user_id.presence or builder_id.presence
  end
end
