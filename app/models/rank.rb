class Rank < ActiveRecord::Base
	self.table_name = "PersonPageRank"
	self.primary_key = "ID"
	belongs_to :page
end