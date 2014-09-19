class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'Dog'
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
