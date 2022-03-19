class Goal < ApplicationRecord
	belongs_to :kind
	belongs_to :user

	validates :title, presence: true
	validates :status, presence: true
	STATUSES = ["奮闘中", "達成", "休憩中"]

end