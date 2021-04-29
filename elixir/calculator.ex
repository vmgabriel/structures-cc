# Gabriel Vargas Monroy

defmodule Calculator do
  def add(a, b) do
    a + b
  end

  def odd(a, b) do
    a - b
  end

  def mult(a, b) do
    a * b
  end

  def div(_, 0) do
    :inf
  end

  def div(a, b) do
    a / b
  end
end


val1 = IO.gets('[Input] Get value 1 - ')
val2 = IO.gets('[Input] Get value 2 - ')
val1 = String.trim(val1)
val2 = String.trim(val2)
val1 = String.to_integer(val1)
val2 = String.to_integer(val2)

operation = IO.gets('[Input] Get Operation (+-*/)- ')
operation = String.trim(operation)


function_operation = cond do
  operation == "+" -> &Calculator.add/2
  operation == "-" -> &Calculator.odd/2
  operation == "*" -> &Calculator.mult/2
  operation == "/" -> &Calculator.div/2
  true -> &Calculator.add/2
end


res_data = function_operation.(val1, val2)
IO.puts res_data
