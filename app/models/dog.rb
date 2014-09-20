class Dog < ActiveRecord::Base

  belongs_to :owner
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :comments, as: :commentable
  has_many :sent_comments, class_name: 'Comment', foreign_key: :author_id
end
