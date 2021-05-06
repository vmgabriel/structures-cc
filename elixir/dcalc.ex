defmodule Dcalc do
  def calculator() do
    receive do
      {pid, :+, a, b} -> send(pid, a + b)
      {pid, :-, a, b} -> send(pid, a - b)
      {pid, :*, a, b} -> send(pid, a * b)
      {pid, :/, _, 0} -> exit("Division For Zero")
      {pid, :/, a, b} -> send(pid, a / b)
    end
    calculator()
  end
end
