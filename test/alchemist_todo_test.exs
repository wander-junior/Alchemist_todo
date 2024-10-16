defmodule AlchemistTodoTest do
  use ExUnit.Case
  doctest AlchemistTodo

  describe "create_todo/0" do
    test "create empty todo list" do
      assert AlchemistTodo.create_todo() == []
    end
  end
end
