class User < ApplicationRecord
  has_one :api_key
  has_many :favorites
end
