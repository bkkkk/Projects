require 'Date'

class Person

  def initialize(first_name, last_name, day_of_birth, date_of_death = "")
    @first_name = first_name
    @last_name = last_name
    @parents = []
    @children = []
    @partners = []
    
    date = {}
    begin
      date = Date.parse(day_of_birth)
    rescue 
      puts "The format is incorrect"
    else
      @day_of_birth = date
    end

    @date_of_death = {}
    if date_of_death != ""
      begin
        date = Date.parse(date_of_death)
      rescue
        puts "DoD format is incorrect"
      else
        @date_of_death = date
      end
    end
  end

  def is_deceased
    return (date_of_death)
  end

  def whole_name
    "#{@first_name} #{@last_name}"
  end

  def add_child(child)
    @children << child
    child.add_parent(self)
  end

  def add_parent(parent)
    @parents << parent
  end

  def age
    Time.now.year - @day_of_birth.year
  end

  def add_partner(partner)
    @partners << partner
  end

  def to_s
    "Name: #{whole_name}
Age: #{age}
Children: #{@children.map { |e| e.whole_name }}
Parents: #{@parents.map { |e| e.whole_name }}
Partners: #{@partners.map { |e| e.whole_name }}"

  end

  def self.create_partnership(first, second)
    first.add_partner(second)
    second.add_partner(first)
  end

  def print_lineage(level = 0)

    puts "#{"\t" * level}#{whole_name}"

    @children.map { |e| e.print_lineage(level + 1) }
  end
end

if __FILE__ == $0
  ana = Person.new("Ana", "Blanco", "1945-01-4")
  mario = Person.new("Mario", "Blanco", "1945-01-4")
  jacob = Person.new("Jacob", "Blanco", "1988-02-24")
  ernesto = Person.new("Ernesto", "Blanco", "1988-02-24")
  horacio = Person.new("Horacio", "Blanco", "1988-02-24")
  alberto = Person.new("Alberto", "Blank", "1988-02-24")
  noa = Person.new("Noa", "Blank", "1988-02-24")
  
  alberto.add_child(noa)

 Person.create_partnership(ana, mario)

  mario.add_child(jacob)
  mario.add_child(alberto)
  mario.add_child(horacio)
  mario.add_child(ernesto)

  ana.add_child(jacob)
  ana.add_child(alberto)
  ana.add_child(horacio)
  ana.add_child(ernesto)

  mario.print_lineage(0)
end