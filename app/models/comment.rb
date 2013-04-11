class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :commentvotes



def vote_count
  Postvote.where('post_id =?', self.id).count
end

def vote_count_reverse
  0 - (Postvote.where('post_id =?', self.id).count)
end


end
