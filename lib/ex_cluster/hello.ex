
defmodule ExCluster.Hello do
  use GenServer

  # API

  def start_link do
    {:ok, pid} = GenServer.start_link(__MODULE__, [])
    :pg2.create("hello")
    :pg2.join("hello", pid)
    {:ok, pid}
  end

  def hello(message) do
    where = :pg2.get_members("hello") |> Enum.random
    GenServer.cast(where, {:hello, message})
  end

  # SERVER

  def init(_) do
    {:ok, nil}
  end

  def handle_cast({:hello, message}, _) do
    IO.puts "Hello: " <> message
    {:noreply, nil}
  end
end
