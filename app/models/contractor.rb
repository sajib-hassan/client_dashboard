class Contractor < ApplicationRecord
  belongs_to :partner_company
  has_many :consultants
  has_many :clients, through: :consultants

  validates :first_name, presence: true
  validates :last_name, presence: true
end
