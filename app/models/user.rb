class User < ApplicationRecord
	validates :first_name, :last_name, presence: true
	validates :email, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :password, length: { minimum: 7 }

	default_scope { where(deleted: false) }
end
