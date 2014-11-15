class Dog < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :owner
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :comments, as: :commentable
  has_many :sent_comments, class_name: 'Comment', foreign_key: :author_id 

  # def age
  #   now = Time.now.utc.to_date
  #   now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  # end

end