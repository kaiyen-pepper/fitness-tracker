class User < ApplicationRecord
  has_many :diet_entries, dependent: :destroy
end
