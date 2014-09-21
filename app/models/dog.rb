class Dog < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :owner
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :comments, as: :commentable
  has_many :sent_comments, class_name: 'Comment', foreign_key: :author_id

 filterrific(
   default_settings: { sorted_by: 'created_at_desc' },
   filter_names: [
     :sorted_by,
     :search_query,
     :with_birthday
   ]
 )

 # Scope definitions. We implement all Filterrific filters through ActiveRecord
 # scopes. In this example we omit the implementation of the scopes for brevity.
 # Please see 'Scope patterns' for scope implementation details.
 scope :search_query, lambda { |query|
   # Filters dogs whose name matches the query
   #...
 }
 scope :sorted_by, lambda { |sort_key|
   # Sorts dogs by sort_key
   #...
 }
 scope :with_created_at_gte, lambda { |ref_date|
   #...
 }


 def self.options_for_sorted_by
   [
     ['Name (a-z)', 'name_asc'],
     ['Age (newest first)', 'created_at_desc'],
     ['Age (oldest first)', 'created_at_asc'],
   ]
 end

end