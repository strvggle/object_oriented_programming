class Human
  def initialize(name)
  	@name = name
  end

    def name
    @name
  end

  def name=(str)
    @name = str
  end
  
  def hello
  	puts "Hi, my name is #{name}."
  end
end

class Bitmaker < Human
   def learn
      puts "I get it!"
   end
end

class Teacher < Human
   def teach
      puts "Everything in Ruby is an Object."
   end
end

teacher = Teacher.new('Craig')
teacher.hello

bitmaker = Bitmaker.new('Will')
bitmaker.hello

teacher.teach
bitmaker.learn

bitmaker.teach

# "Student" (in my case "bitmaker") doesn't inheret the teach method, ie doesn't inherit methods via parent class