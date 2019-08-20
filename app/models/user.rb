class User < ApplicationRecord
  validates :mail_address, {presence: true, uniqueness: true}
end
