class Book < ApplicationRecord

	belongs_to :user

	validates :opinion, presence: true, length:{ maximum: 200 }
	validates :title, presence: true

end
