class Kind < ApplicationRecord
	has_many :goals, dependent: :destroy
end
