defmodule Registers do
  def max_register_at_end(expressions) do
    registers = Enum.reduce(expressions, %{}, fn(expression, registers) ->
      [target_register, target_operator, target_value, _, condition_register, condition_operator, condition_value] = String.split(expression)
      if compare(Map.get(registers, condition_register, 0), condition_operator, String.to_integer(condition_value)) do
        Map.put(registers, target_register, evaluate(Map.get(registers, target_register, 0), target_operator, String.to_integer(target_value)))
      else
        registers
      end
    end)

    Map.values(registers)
    |> Enum.max
  end


  def max_register_throughout(expressions) do
    {_, max} = Enum.reduce(expressions, {%{}, 0}, fn(expression, {registers, max}) ->
      [target_register, target_operator, target_value, _, condition_register, condition_operator, condition_value] = String.split(expression)
      if compare(Map.get(registers, condition_register, 0), condition_operator, String.to_integer(condition_value)) do
        new_registers = Map.put(registers, target_register, evaluate(Map.get(registers, target_register, 0), target_operator, String.to_integer(target_value)))

        current_max = Enum.max(Map.values(new_registers))
        if current_max > max do
          {new_registers, current_max}
        else
          {new_registers, max}
        end
      else
        {registers, max}
      end
    end)

    max
  end

  defp evaluate(register, "inc", value), do: register + value
  defp evaluate(register, "dec", value), do: register - value

  defp compare(register, "!=", value), do: register != value
  defp compare(register, "<", value), do: register < value
  defp compare(register, "<=", value), do: register <= value
  defp compare(register, "==", value), do: register == value
  defp compare(register, ">", value), do: register > value
  defp compare(register, ">=", value), do: register >= value
end
