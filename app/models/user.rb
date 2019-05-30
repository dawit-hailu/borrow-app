class User < ApplicationRecord
	has_many :uploads

	has_secure_password
end
