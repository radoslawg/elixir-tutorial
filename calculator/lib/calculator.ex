defmodule Calculator do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(current_value) do
    current_value = receive do
      {:value, client_id} -> 
        send(client_id, {:response, current_value})
        current_value

      {:add, value} -> current_value + value
      {:sub, value} -> current_value - value
      {:mult, value} -> current_value * value
      {:divide, value} -> div(current_value, value)

      invalid_request -> IO.puts("Invalid Request #{inspect invalid_request}")
    end
    loop(current_value)
  end

  def value(server_id) do
    send(server_id, {:value, self()})
    receive do
      {:response, value} -> value
    end
  end

  def add(server_id, value)do
    send(server_id, {:add, value})
    value(server_id)
  end

  def sub(server_id, value)do
    send(server_id, {:sub, value})
    value(server_id)
  end

  def mult(server_id, value)do
    send(server_id, {:mult, value})
    value(server_id)
  end

  def divide(server_id, value)do
    send(server_id, {:divide, value})
    value(server_id)
  end

end
