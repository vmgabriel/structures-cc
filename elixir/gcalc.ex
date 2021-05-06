defmodule GCalc do
  use GenServer

  def init(param) do
    IO.puts('Start Genserver Gcalc')
    IO.inspect param
    {:ok, %{count: 0}}
  end

  def handle_info() do
  end
end
