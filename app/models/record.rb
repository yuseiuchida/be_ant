class Record < ApplicationRecord
	belongs_to :user
	belongs_to :goal
	has_many :reactions

	enum bug_status: { アリ: 1, キリギリス: 0 }
end
