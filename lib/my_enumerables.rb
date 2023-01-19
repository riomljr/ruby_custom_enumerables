module Enumerable
  # Your code goes here

  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  
  # Define my_each here
  def my_each
    if block_given?
      for i in 0...self.length
        yield self[i]
      end
    end
    self
  end

  def my_each_with_index 
    if block_given?
      for i in 0...self.length
        yield [self[i], i]
      end
    end
    self
  end

  def my_select 
    choosen = []
    self.my_each {|number| choosen << number if yield number} if block_given?
    choosen
  end

  def my_all?
    choosen = []
    self.my_each {|number| choosen << number if yield number} if block_given?
    choosen.length == self.length ? true : false
  end

  def my_any?
    choosen =[]
    self.my_each {|number| choosen << number if yield number} if block_given?
    choosen.length > 0 ? true : false
  end

  def my_none?
    choosen =[]
    self.my_each {|number| choosen << number if yield number} if block_given?
    choosen.length == 0 ? true : false
  end

  def my_count
    count = 0
    if block_given?
      self.each {|number| count += 1 if yield number} 
      count
    else
      self.length
    end
  end

  def my_map
    transformed = []
    self.my_each {|number| transformed << (yield number)} if block_given?
    transformed
  end

  def my_inject(value)
    if block_given?
      summed = value
      self.my_each {|number| summed = yield summed, number} 
      summed
    end
  end

end
 

