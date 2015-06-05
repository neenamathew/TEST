class Course < ActiveRecord::Base
	belongs_to :departments
	has_many :teachers
	has_many :coursestudents
	has_many :students, :through => :coursestudents
end
