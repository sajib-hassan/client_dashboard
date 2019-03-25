class Client < ApplicationRecord
  has_many :consultants, dependent: :delete_all
  has_many :employees, through: :consultants
  has_many :contractors, through: :consultants

  validates :ctoken, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_validation :generate_token, on: :create

  private

  def generate_token
    begin
      self.ctoken = SimpleTokenGenerator::Generator.call(slices: 3, size_of_slice: 2)
    end while self.class.exists?(ctoken: ctoken)
  end
end
