class Consultant < ApplicationRecord
  belongs_to :client
  belongs_to :contractor, optional: true
  belongs_to :employee, optional: true
end
