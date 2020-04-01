class Homework
  attr_reader :title, :description, :students

  def initialize(title, description)
    @title = title
    @description = description
    @students = []
  end
end