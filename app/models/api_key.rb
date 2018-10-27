class ApiKey < ApplicationRecord
  belongs_to :user
  validates :value, uniqueness: true
end
