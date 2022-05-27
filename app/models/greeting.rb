class Greeting < ApplicationRecord
    has_many :favorites, dependent: :destroy
end
