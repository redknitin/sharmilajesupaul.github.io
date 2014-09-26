class Tree
  # declares all the instance variables that occur 
  # age height and number of oranges are defaulted to 0 
  # the tree is not dead 
  # and 0 oranges have been picked
  def initialize (type, produce)
    @type = type
    @produce = produce
    @age = 0
    @height = 0
    @produce_left = 0
    @dead = false
    @produce_picked = 0
    @drought = false
  end

  # outputs the hight 
  def get_height
    puts "Your #{@type} tree is: #{@height}ft tall."
  end

  # advances time forward by one year
  def one_year_passes
    passage_of_time
    puts "Your #{@type} tree is: #{@age} years old."
  end

  # outputs the number of oranges left 
  def number_of_oranges
    puts "There are #{@produce_left} #{@produce}s left on your #{@type} tree."
  end

  # if there are more than one oranges,
  # add 1 to orange_picked and subtract 1 from number of 
  # oranges. 
  # outputs the number of oranges you have picked 
  def pick
    if @produce_left > 0
      @produce_picked += 1
      @produce_left -= 1
      puts "You have picked #{@produce_picked} #{@produce}(s)."
    else
      puts "There are no #{@produce}s to pick!"
    end
  end


  def drought
    passage_of_time
    puts "There is a drought!!"
    @drought = true
  end

private

def passage_of_time

  if !@dead 
    @age += 1
  end 

  if !@dead && !@drought
    @height += 2
  end

  if @age >= 3 && @age <= 5
    @produce_left = 5
  elsif  @age >= 6 && @age <= 12
    @produce_left = 9
  elsif @age >= 13 && @age <= 20
    @produce_left = 15
  else
    @produce_left = 0
  end

  if @age == 20 || @dead == true || @drought == true 
    puts "Your tree is dead :("
  end


end

end

tree = Tree.new('evil', 'spike of doom')

tree.get_height
tree.one_year_passes
tree.one_year_passes
tree.number_of_oranges
tree.one_year_passes
tree.number_of_oranges
tree.pick
tree.pick
tree.number_of_oranges
tree.one_year_passes
tree.one_year_passes
tree.number_of_oranges
tree.pick
tree.number_of_oranges
tree.get_height
tree.one_year_passes
tree.one_year_passes
tree.pick
tree.one_year_passes
tree.drought
tree.number_of_oranges
tree.pick
tree.one_year_passes