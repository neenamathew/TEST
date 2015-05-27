class Restaurant

def initialize(menu)
  @menu=menu
  @costotal=0
end
 
def sam
 puts @menu['rice']
 puts @menu['noodles']
end

def cost_calculate(order)
  puts "hi"
  @cost=0
  @costr=0
  @costn=0
  
order.each do |key,value|
value.each do |key2,value2|

if key2=='rice'
 @costr=(value2* @menu['rice'])
 puts "#{@costr}"
 else
 @costn=(value2* @menu['noodles'])
  puts "#{@costn}"
 end
end

@cost =  @cost + @costr + @costn
 puts "#{@cost}"

end

  puts "#{@cost}"
  @costotal=@cost
  puts "#{@costotal}"
  puts "hi3"
end

def print
 puts "hi4"
 puts "#{@cost}"
end
 
end

qmenu = Restaurant.new({'rice' => 30,'noodles' => 20})
qmenu.sam()
qmenu.cost_calculate({'customer1' =>{'rice'=>2,'noodles'=>1},'customer2'=>{'rice'=>3,'noodles'=>2},'customer3'=>{'rice'=>4,'noodles'=>2},'customer4'=>{'rice'=>3,'noodles'=>0}})
qmenu.print()
