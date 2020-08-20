class Post < ApplicationRecord
	belongs_to :user

	has_many :favorites, dependent: :destroy
	has_many :Bookmarks, dependent: :destroy

	validates :title, presence: true
	validates :time, presence: true
	validates :word, presence: true
	validates :body, presence: true

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
