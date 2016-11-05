defmodule Math.Calculate do
  use GenServer

  @name __MODULE__

  def start_link do
    GenServer.start_link(@name, :ok, name: @name)
  end

  def init(:ok) do
    {:ok, :ok}
  end

  def divide(num1, num2) do
    GenServer.call(@name, {:divide, num1, num2})
  end

  def handle_call({:divide, num1, num2}, _from, :ok) do
    IO.puts num1/num2
    {:reply, :ok, :ok}
  end
end
