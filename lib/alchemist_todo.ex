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

  defp complete(%AlchemistTodo{} = list) do
    IO.puts("Choose a item to complete (type the number):")

    Enum.with_index(list.undone, 1)
    |> Enum.each(fn {item, index} ->
      IO.puts("#{index} - #{item}")
    end)

    IO.gets("")
    |> String.trim()
    |> Integer.parse()
    |> elem(0)

    loop(list)
  end

  defp loop(%AlchemistTodo{} = list) do
    prompt = """
    Choose a option:
    a - add a new to do
    r - read todo list
    c - complete a item
    """

    command = IO.gets(prompt)
    |> String.trim()

    case command do
      "a" -> add(list)
      "r" -> read(list)
      "c" -> complete(list)
      _ -> loop(list)
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
