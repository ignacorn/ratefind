class Keyword < ActiveRecord::Base
	self.table_name = "Keywords"
	self.primary_key = "ID"
	belongs_to :person, foreign_key: 'personID'
end
