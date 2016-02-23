class Relation < ActiveRecord::Base
  belongs_to :target, class_name: 'User', foreign_key: 'target_id'
  belongs_to :from, class_name: 'User', foreign_key: 'from_id'
end