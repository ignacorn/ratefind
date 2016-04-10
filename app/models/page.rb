class Page < ActiveRecord::Base
	self.table_name = "Pages"
	self.primary_key = "ID"
	has_many :ranks, foreign_key: 'PageID'
	belongs_to :site, foreign_key: 'SiteID'
end