# This is a tree class inspired by Chris Pine's Orange Tree. The tree has the ability
# to increase in age and height. It can also produce any type of product you intialize 
# it with. The tree can die naturally at age 20 or in a drought if it is still producing
# product. 

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
    puts "Your #{@type} tree is: #{@age} years old." if !@dead
  end

  # outputs the number of oranges left 
  def number_of_produce
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

  # outputs that there is a drought 
  # set @drought to true
  def drought
    puts "There is a drought!!"
    @drought = true
    passage_of_time
  end

  private



  # this method handles all of the logic that takes place when time
  # advances forward:
  # we check to see if the tree is dead 
  # and then increase height, age, and number of produce, accordingly. 
  def passage_of_time
  
    # if the tree is 20 years old, or @dead is true outputs that your tree is dead. 
    puts "Your tree is dead :(" if @age == 20 || @dead == true
  
    # if the tree is still creating produce and there is a drought, it dies. 
    # if there are no produce, it survives and the drought ends
    if @produce_left > 0 && @drought == true 
      @dead = true
      puts "Your tree didn't survive the drought :("
      @drought = false
    elsif @drought == true 
      puts "your tree survived tree survived the drought :D"
      @drought = false
    end
    
    # increment age by 1 if the tree is not dead
    @age += 1 if !@dead 
  
    # if the tree is not dead and there is no drought
    # the height increases by 2 feet
    @height += 2 if !@dead && !@drought
    
    # when age is between the criteria below, produce is incremented or set to 0 
    case @age 
    when 3..5 then @produce_left = 5
    when 6..12 then @produce_left = 9
    when 13..20 then @produce_left = 15
    else @produce_left = 0
    end
  end
end

# we initialize a new 'evil' tree that produces a 'blood goblin'
tree = Tree.new('evil', 'blood goblin')

tree.get_height # => Your evil tree is: 0ft tall.
tree.one_year_passes # => Your evil tree is: 1 years old.
tree.one_year_passes # => Your evil tree is: 2 years old.
tree.drought # => There is a drought!!
# => your tree survived tree survived the drought :D
tree.number_of_produce # => There are 5 blood goblins left on your evil tree.
tree.one_year_passes # => Your evil tree is: 4 years old.
tree.number_of_produce # => There are 5 blood goblins left on your evil tree.
tree.pick # => You have picked 1 blood goblin(s).
tree.pick # => You have picked 2 blood goblin(s).
tree.number_of_produce # => There are 3 blood goblins left on your evil tree.
tree.one_year_passes # => Your evil tree is: 5 years old.
tree.one_year_passes # => Your evil tree is: 6 years old.
tree.number_of_produce # => There are 9 blood goblins left on your evil tree.
tree.pick # => You have picked 3 blood goblin(s).
tree.number_of_produce # => There are 8 blood goblins left on your evil tree.
tree.get_height # => Your evil tree is: 12ft tall.
tree.one_year_passes # => Your evil tree is: 7 years old.
tree.drought # => There is a drought!!
# => Your tree didn't survive the drought :(
tree.one_year_passes # => Your tree is dead :(
