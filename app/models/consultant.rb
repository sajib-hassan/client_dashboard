class Consultant < ApplicationRecord
  belongs_to :client
  belongs_to :contractor
  belongs_to :employee
end
