defmodule AlchemistTodo do
  @moduledoc """
  Documentation for `AlchemistTodo`.
  """

  defp create_todo(), do: []

  defp add(list) when is_list(list) do
    new_item = IO.gets("Type your new item\n")

    loop(["[ ] #{new_item}" | list])
  end

  defp read(list) do
    IO.puts(list)
    loop(list)
  end

  defp loop(todo) do
    prompt = """
    Choose a option:
    a - add a new to do
    r - read todo list
    """

    command = IO.gets(prompt)
    |> String.trim()

    case command do
      "a" -> add(todo)
      "r" -> read(todo)
      _ -> loop(todo)
    end
  end

  @doc """
  Initialize command loop
  """
  def initialize() do
    todo = create_todo()
    loop(todo)
  end
end
