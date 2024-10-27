defmodule AlchemistTodo do
  @moduledoc """
  Documentation for `AlchemistTodo`.
  """

  defstruct undone: [], done: []

  defp create_todo(), do: %AlchemistTodo{}

  defp add(%AlchemistTodo{} = list) do
    new_item = IO.gets("Type your new item\n")

    loop(%{list | undone: [new_item | list.undone]})
  end

  defp read(%AlchemistTodo{} = list) do
    IO.puts("Undone Items: ")

    cond do
      length(list.undone) > 0 -> IO.puts(list.undone)
      true -> IO.puts("There is no undone item")
    end

    IO.puts("Done Items: ")

    cond do
      length(list.done) > 0 -> IO.puts(list.done)
      true -> IO.puts("There is no done item")
    end

    loop(list)
  end

  defp loop(%AlchemistTodo{} = todo) do
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
    create_todo()
    |> loop()
  end
end
