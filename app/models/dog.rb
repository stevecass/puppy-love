class Dog < ActiveRecord::Base

  belongs_to :owner
  has_many :messages
  has_many :comments, as: :commentable
  has_many :sent_comments, class_name: 'Comment', foreign_key: :author_id
end
