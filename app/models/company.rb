class Company < ApplicationRecord
  has_many :employees, dependent: :delete_all

  validates :name, presence: true
  validates :identity, presence: true, uniqueness: true

  before_validation :generate_token, on: :create

  private

  def generate_token
    begin
      self.identity = SimpleTokenGenerator::Generator.call
    end while self.class.exists?(identity: identity)
  end
end
