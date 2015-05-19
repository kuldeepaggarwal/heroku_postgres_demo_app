class Activity < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Scopes
  scope :followers, -> { where(entity_type: 'Follower' ) }
  scope :on, ->(timestamp) {
    where(
      arel_table[:created_at].between(timestamp.beginning_of_day..timestamp.end_of_day)
    )
  }
end
