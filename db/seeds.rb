require 'faker'

23.times do
  User.create :username => Faker::Name.first_name,
              :password => "123",
              :email => Faker::Internet.email
end   

42.times do
  user = User.find(rand(22)+1)
  user.posts.create(:title => Faker::Company.bs,
                    :url => Faker::Internet.domain_name)
end
  
170.times do
  post = Post.find(rand(41)+1)
  user = User.find(rand(22)+1)
  post_comments = Comment.where('post_id = ?', post.id)
  if post_comments.length == 0
    parent_id = nil
  else
    rand(5) == 3 ? parent_id = nil : parent_id = post_comments[rand(post_comments.length)-1].id
  end
  comment = Comment.new(:user_id => user.id,
                        :post_id => post.id,
                        :content => Faker::Lorem.sentence,  
                        :parent_id => parent_id)
  comment.save
end 

200.times do
  post = Post.find(rand(41)+1)
  user = User.find(rand(22)+1)
  postvote = Postvote.new(:user_id => user.id,
                        :post_id => post.id)
  postvote.save
end

480.times do
  comment = Comment.find(rand(169)+1)
  user = User.find(rand(22)+1)
  commentvote = Commentvote.new(:user_id => user.id,
                                :post_id => post.id)
  commentvote.save
end
