class User < ApplicationRecord
<<<<<<< HEAD
  has_many :diet_entries, dependent: :destroy
=======
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
>>>>>>> origin/kaitl-branch-new
end
