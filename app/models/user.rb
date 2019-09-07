class User < ApplicationRecord
  validates :mail_address, {presence: true, uniqueness: true}
  validates :user_name, {presence: true}
  validates :password, {presence: true}
end
