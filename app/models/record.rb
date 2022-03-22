class Record < ApplicationRecord
	belongs_to :user
	belongs_to :goal
	has_many :reactions, dependent: :destroy

	enum bug_status: { アリ: 1, キリギリス: 0 }
	validates :content, :bug_status, presence: true
	validates :goal_id, presence: true
end
