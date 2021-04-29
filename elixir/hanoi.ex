# Author: Gabriel Vargas Monroy

defmodule Pile do
  def new do
    []
  end

  def add(data, pile) do
    [data] ++ pile
  end

  def pop([]) do
    [nil, []]
  end

  def pop(pile) do
    [x | rest] = pile
    [x, rest]
  end

  def get(pile) do
    hd(pile)
  end

  def clear?(pile) do
    length(pile) == 0
  end
end


defmodule Hanoi do
  defstruct [left: Pile.new(), center: Pile.new(), right: Pile.new()]
end


defmodule Hanoi.Initialize do
  def fill(max) do
    %Hanoi{left: put_datas(Pile.new(), max)}
  end

  defp put_datas(pile, max) when max < 1 do
    pile
  end

  defp put_datas(pile, max) do
    max..1
    |> Enum.reduce(pile, &Pile.add/2)
  end
end


defmodule Hanoi.Execute do
  def move(hanoi, data, direction \\ :right)

  def move(hanoi, 1, direction) do
    src = opposite(direction)
    change_position(hanoi, src, direction)
  end

  def move(hanoi, 2, direction) do
    src = opposite(direction)

    hanoi
    |> move(1, direction)
    |> change_position(src, :center)
    |> move(1, src)
    |> change_position(:center, direction)
    |> move(1, direction)
  end

  def move(hanoi, n, direction) do
    src = opposite(direction)

    hanoi
    |> move(n - 1, direction)
    |> IO.inspect
    |> change_position(src, :center)
    |> IO.inspect
    |> move(n - 1, src)
    |> IO.inspect
    |> change_position(:center, direction)
    |> IO.inspect
    |> move(n - 1, direction)
  end

  defp change_position(hanoi, src, dst) do
    [data, src_pile] = Pile.pop(Map.get(hanoi, src))
    hanoi = Map.replace(hanoi, src, src_pile)
    Map.replace(hanoi, dst, Pile.add(data, Map.get(hanoi, dst)))
  end

  defp opposite(dipstick) do
    cond do
      dipstick == :left -> :right
      dipstick == :right -> :left
      true -> :center
    end
  end
end


defmodule Async do
  def init_async(max \\ 20) do
    1..max
    |> Enum.map(&generate/1)
  end

  defp generate(data) do
    hanoi_base = Hanoi.Initialize.fill(data)
    spawn(Hanoi.Execute, :move, [hanoi_base, data])
  end
end

IO.puts('Hanoi')
modules = Async.init_async()
IO.inspect modules
