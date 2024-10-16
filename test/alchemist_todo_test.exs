defmodule AlchemistTodoTest do
  use ExUnit.Case
  doctest AlchemistTodo

  describe "create_todo/0" do
    test "create empty todo list" do
      assert AlchemistTodo.create_todo() == []
    end
  end

  describe "add/1" do
    test "returns error when adding to a non-list value" do
      assert AlchemistTodo.add("invalid_input") == {:error, "Invalid arguments when adding new item"}
    end
  end
end
