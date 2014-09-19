class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'Dog'
  belongs_to :recipient, class_name: 'Dog'
end
