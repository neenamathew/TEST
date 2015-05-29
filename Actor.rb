require 'csv'
require 'nokogiri'

class Actor

 	def generate_csv
		file = File.read('actors63.xml')
		doc = Nokogiri::XML(file)
		CSV.open('outp.csv', 'wb') do |csv|
  			doc.search('actor').each do |x|
   				csv << x.search('*').map(&:text)
    		end
		end
	end

	def generate_csv_by_query(actor)
		actorname = []
		CSV.foreach(File.path("/home/teena/output.csv")) do |details|
    		if details[1]==actor["dob"]
    			actorname << details[0] 
            end
		end
		if actorname.empty?
			puts "no actor with this date of birth"
	    else		
            puts actorname.to_s
        end    
     end

end

actor=Actor.new
actor.generate_csv
actor.generate_csv_by_query({"dob" => "1961"})