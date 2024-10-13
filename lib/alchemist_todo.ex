defmodule AlchemistTodo do
  @moduledoc """
  Documentation for `AlchemistTodo`.
  """

  @doc """
  create_todo a new todo list.
  """
  def create_todo(), do: []

  @doc """
  Add item to todo list.

  Returns `["[ ] item" | list]`.

  #Examples

    iex> AlchemistTodo.add("Buy milk", [])
    ["[ ] Buy milk"]

  """
  def add(item, list) when is_bitstring(item) and is_list(list) do
    ["[ ] #{item}" | list]
  end

  def add(_, _), do: {:error, "Invalid arguments"}
end
