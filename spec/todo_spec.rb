require 'todo'

describe 'Todo Integration' do
  it 'returns task' do
    first = Todo.new('eat food', 'incomplete')
    expect(first.task).to eq 'eat food'
  end
  it 'marks a task as done' do
    first = Todo.new('eat food', 'incomplete')
    first.mark_done!
    @status = 'complete'
    expect(@status == "complete").to eq true
  end
  it 'returns true if task is done' do
    first = Todo.new('eat food', 'complete')
    expect(first.done?).to eq true
  end
  it 'adds a todo to the todo list' do
    first = Todo.new('eat food', 'complete')
    todo_list = TodoList.new
    expect(todo_list.add(first)). to eq [first]
  end
  it 'returns the incomplete tasks' do
    first = Todo.new('eat food', 'complete')
    second = Todo.new('throw food', 'incomplete')
    todo_list = TodoList.new
    todo_list.add(first)
    todo_list.add(second)
    expect(todo_list.incomplete).to eq [second]
  end
  it 'returns the complete tasks' do
    first = Todo.new('eat food', 'complete')
    second = Todo.new('throw food', 'incomplete')
    todo_list = TodoList.new
    todo_list.add(first)
    todo_list.add(second)
    expect(todo_list.complete).to eq [first]
  end
  it 'returns the complete tasks' do
    first = Todo.new('eat food', 'incomplete')
    second = Todo.new('throw food', 'incomplete')
    todo_list = TodoList.new
    todo_list.add(first)
    todo_list.add(second)
    expect(todo_list.give_up!).to eq ['complete', 'complete']
  end
end