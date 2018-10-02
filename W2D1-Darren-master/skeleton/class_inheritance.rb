class Employee

  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end


class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    self.total_sub_salaries * multiplier
  end

  protected

  def add_employee(subordinate)
    employees << subordinate

    subordinate
  end

  def total_sub_salaries
    total_sub_sal = 0

    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_sub_sal += employee.salary + employee.total_sub_salary
      else
        total_sub_sal += employee.salary
      end
    end

    total_sub_sal
  end

end


ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000, "Ned")
shawna = Employee.new("Shawna", "TA", 12_000, "Darren")
david = Employee.new("David", "TA", 10_000, "Darren")


ned.bonus(5)
darren.bonus(4)
david.bonus(3)
