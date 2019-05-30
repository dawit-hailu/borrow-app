class Upload < ApplicationRecord
  belongs_to :user
  has_attached_file :upload

end
