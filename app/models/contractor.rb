class Contractor < ApplicationRecord
  belongs_to :partner_company
  has_many :consultants, dependent: :destroy
  has_many :clients, through: :consultants

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :for_given_clients, -> (client_ids) { joins(:clients).where("clients.id" => client_ids) }

  def clients_without_employees
    clients - Client.joins(:consultants).where.not(consultants: {employee_id: nil}).uniq
  end

  def client_ids
    clients.ids
  end
end
