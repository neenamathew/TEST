require 'csv'
require 'nokogiri'

class Actor
	#Convert xml to csv file
 	def generate_csv
		file = File.read('actors63.xml')
		doc = Nokogiri::XML(file)
		CSV.open('output.csv', 'wb') do |csv|
			csv <<["STAGENAME","DOWSTART","DOWEND","FAMILYNAME","FIRSTNAME","GENDER","DOB","DOD","ROLETYPE","ORIGIN","STUDIO","RELATIONSHIPS","RELTYPE","RELNAME"]
  			doc.search('actor').each do |x|
   				csv << x.search('*').map(&:text)
    		end
		end
	end
	#Extrat from CSV
	def generate_csv_by_query(actor)
		actorname = []
		actor_parameter = ["STAGENAME","DOWSTART","DOWEND","FAMILYNAME","FIRSTNAME","GENDER","DOB","DOD","ROLETYPE","ORIGIN","STUDIO","RELATIONSHIPS","RELTYPE","RELNAME"]
				CSV.foreach(File.path("output.csv")) do |details|
				
					actor_parameter.each do |name|
						if actor.has_key?(name) and actor.has_value?(details[actor_parameter.index(name)])
							actorname << details
							
						
					end

    			end
    				
            	end
		if actorname.empty?
			puts "NO ACTORS WITH THIS PARAMETER"
	    else		
            puts actorname.to_s
        end   

        CSV.open("File_with_dob.csv", "w") do |csv|
        	csv << ["NAME"]
  			actorname.each do |name|
  				csv << [name]
  			end
   		end 
    end

end

parameter_query=Hash.new
actor=Actor.new
actor.generate_csv
puts "ENTER PARAMETER"
parameter=gets.chomp
puts "ENTER QUERY"
query=gets.chomp
parameter_query[parameter]=query
actor.generate_csv_by_query(parameter_query)
