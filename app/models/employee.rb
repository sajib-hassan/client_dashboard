class Employee < ApplicationRecord
  belongs_to :company
  has_many :consultants, dependent: :destroy
  has_many :clients, through: :consultants

  validates :identifier, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_validation :generate_token, on: :create

  scope :for_given_clients, -> (client_ids) { joins(:clients).where("clients.id" => client_ids) }

  def client_ids
    clients.ids
  end

  private

  def generate_token
    loop do
      self.identifier = SimpleTokenGenerator::Generator.call(slices: 3, size_of_slice: 2)
      break unless self.class.exists?(identifier: identifier)
    end
  end
end
