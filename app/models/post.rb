class Post < ApplicationRecord
	belongs_to :user

	has_many :favorites, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	has_many :users, through: :bookmarks

	validates :date, presence: true
	validates :title, presence: true
	validates :time, presence: true
	validates :word, presence: true
	validates :body, presence: true

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end

    def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
    end

    default_scope -> { order(created_at: :desc) }
    scope :search_by_keyword, -> (keyword) {
    where("title LIKE :keyword OR word LIKE :keyword OR body LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%",keyword: "%#{sanitize_sql_like(keyword)}%",keyword: "%#{sanitize_sql_like(keyword)}%" ) if keyword.present?
}

end
