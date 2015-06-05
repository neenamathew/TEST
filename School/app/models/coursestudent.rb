class Coursestudent < ActiveRecord::Base
	has_many :courses
	has_many :students
end
