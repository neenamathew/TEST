module State
 
  def initialize(state_list)
  	@states= state_list
  	@user_state=@states[0]
  	@index=0
  end

  def previous_state
  	if @index!=0
  		@index =@index-1
   		@user_state=@states[@index]
   	   	else
   		puts "First Element so no previous"
   	end
  end

  def next_state
  		temp=(@states.length-1)
        if @index!= temp
        	@index =@index+1
  			@user_state=@states[@index]
  		else
  			puts "Last Element so no next"
  		end
  	end

 def check_state(input_state)
 	ind=@states.index(input_state)
 		if ind<=@index
  			@user_state=@states[ind]
  			@index=ind
    	elsif ind == @index+1
  			@user_state=@states[ind]
  			@index=ind
    	else
  			puts "not possible"
    	end
 	end
end

class User
  include State
  
  	def print_current_state
  	puts "CURRENT STATE : #{@user_state}"
    end
  
end



puts "ENTER STATES"
arr=gets.chomp
User_object1=User.new(arr)
User_object1.print_current_state
User_object1.next_state
User_object1.print_current_state
User_object1.previous_state
User_object1.print_current_state
puts "ENTER STATE"
op=gets.chomp
User_object1.check_state(op)
User_object1.print_current_state

				