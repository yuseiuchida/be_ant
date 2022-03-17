class Goal < ApplicationRecord
	belongs_to :kind
	belongs_to :user

	enum status: { 奮闘中: 0, 達成: 1}
end
