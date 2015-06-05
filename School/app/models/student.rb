class Student < ActiveRecord::Base
	has_one :coursestudents
	has_one :courses, :through => :coursestudents
	belongs_to :department
end
