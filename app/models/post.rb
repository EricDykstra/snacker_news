class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  validates :url, :uniqueness => true

  def author
    self.user.username
  end

  def comment_count
    Comment.where('post_id = ?', self.id).length
  end

  def comments?
    return true if comment_count > 0
    false
  end

  def vote_count
  Postvote.where('post_id =?', self.id).count
  end

  def vote_count_reverse
  0 - (Postvote.where('post_id =?', self.id).count)
  end

end
