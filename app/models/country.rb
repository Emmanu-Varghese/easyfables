class Country < ApplicationRecord
	validates :name, presence: true
	validates :country_code, presence: true
	validates_uniqueness_of :name, :case_sensitive => false
	validates_uniqueness_of :country_code, :case_sensitive => false
end
