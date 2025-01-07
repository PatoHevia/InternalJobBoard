class JobOffer < ApplicationRecord
    belongs_to :user, foreign_key: 'created_by', optional: true
    has_many :applications
    has_many :users, through: :applications
  end
  