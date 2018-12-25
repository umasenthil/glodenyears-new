class Room < ApplicationRecord
    belongs_to :user, optional: true
end
