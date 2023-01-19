# File: lib/todo_list.rb
class TodoList
  def initialize
    @todolist = []
  end

  def add(todo)
    @todolist << todo
  end

  def incomplete
    incomplete = []
    @todolist.each do |x|
      if x.done? == false
        incomplete << x
      end
    end
    return incomplete
  end

  def complete
    complete = []
    @todolist.each do |x|
      if x.done? == true
        complete << x
      end
    end
    return complete
  end

  def give_up!
    given_up = []
    @todolist.each do |x|
      given_up << x.mark_done!
    end
    return @todolist = given_up
  end
end

# File: lib/todo.rb
class Todo
  def initialize(task,status) # task is a string
    @task = task
    @status = status
  end

  def task
    return @task
  end

  def mark_done!
    @status = 'complete'
  end

  def done?
    if @status == "complete"
      return true
    else
      return false
    end
  end
end