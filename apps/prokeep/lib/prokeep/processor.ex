defmodule Prokeep.Processor do
  use GenServer

  @server_id :processor

  def start_link(_),
    do: GenServer.start_link(__MODULE__, nil, name: @server_id)

  @impl true
  def init(_) do
    {:ok, []}
  end

  @impl true
  def handle_call({:add_message, msg}, _from, msgs) do
    send_future_print()
    {:reply, :ok, msgs ++ [msg]}
  end

  @impl true
  def handle_info({:print_msg}, [msg | tl]) do
    IO.puts(msg)
    send_future_print()
    {:noreply, tl}
  end

  def handle_info({:print_msg}, []),
    do: {:noreply, []}

  def add_message(message),
    do: GenServer.call(@server_id, {:add_message, message})

  defp send_future_print() do
    Process.sleep(1000)
    Process.send(@server_id, {:print_msg}, [:noconnect])
  end
end
