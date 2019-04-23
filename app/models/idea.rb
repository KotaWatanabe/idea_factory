class Idea < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user
    belongs_to :user
    has_many :reviews, dependent: :destroy
    validates :title, presence: true
end
