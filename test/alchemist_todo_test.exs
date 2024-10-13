defmodule AlchemistTodoTest do
  use ExUnit.Case
  doctest AlchemistTodo

  test "create empty todo list" do
    assert AlchemistTodo.create_todo() == []
  end

  test "add new item" do
    assert AlchemistTodo.add("Buy milk", ["[ ] Buy chocolate"]) == ["[ ] Buy milk", "[ ] Buy chocolate"]
  end

  test "add invalid item" do
    assert AlchemistTodo.add(132, 12) == {:error, "Invalid arguments"}
  end
end
