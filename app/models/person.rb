class Person < ActiveRecord::Base
	self.table_name = "Persons"
	self.primary_key = "ID"
	has_many :keywords, dependent: :destroy, foreign_key: 'personID'


end
