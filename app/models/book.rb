class Book < ApplicationRecord
	scope :created_today, -> {where(created_at: Time.zone.now.all_day)}
	scope :created_yesterday, -> {where(created_at: 1.day.ago.all_day)}
	scope :created_this_week, -> {where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day)}
	scope :created_lasy_week, -> {where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day)
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
