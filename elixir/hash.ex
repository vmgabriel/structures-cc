# Gabriel Vargas Monroy

defmodule HashTable do
  def add(map, data) do
    value = if map[data], do: map[data] + 1, else: 1
    Map.put(map, data, value)
  end

  def include(list, map \\ %{})

  def include([h | []], map) do
    HashTable.add(map, h)
  end

  def include([h | rest], map) do
    map = HashTable.add(map, h)
    include(rest, map)
  end
end


data = [1,2,3,4,5,3,2,1,4,5,3,2,1,4,5,3,1,3,5,2,3]

map = HashTable.include(data)

IO.inspect map
