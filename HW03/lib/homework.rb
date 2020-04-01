class Homework
  attr_accessor :status, :student
  attr_reader :title, :description

  def initialize(title, description)
    @title = title
    @description = description
    @student = nil
    @status = 'new'
  end
end