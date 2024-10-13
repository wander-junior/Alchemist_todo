defmodule AlchemistTodoTest do
  use ExUnit.Case
  doctest AlchemistTodo

  test "greets the world" do
    assert AlchemistTodo.hello() == :world
  end
end
