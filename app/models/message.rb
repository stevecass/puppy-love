class Message < ActiveRecord::Base
  belongs_to :sender, :recipient, class_name: 'Dog'
end
