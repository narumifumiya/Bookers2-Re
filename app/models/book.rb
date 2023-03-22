class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # book検索時に使用 searchの検索方法によって条件分岐
  # searchesコントローラーにて使用
  def self.looks(search, word)
    if search == "perfect_match"
      Book.where("title Like?", "#{word}")
    elsif search == "forward_match"
      Book.where("title Like?", "#{word}%")
    elsif search == "backward_match"
      Book.where("title Like?", "%#{word}")
    elsif search == "partial_match"
      Book.where("title Like?", "%#{word}%")
    else
      Book.all
    end
  end

end
