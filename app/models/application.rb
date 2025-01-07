class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer

  validates :user_id, uniqueness: { scope: :job_offer_id, message: "ya has postulado a esta oferta." }
end
