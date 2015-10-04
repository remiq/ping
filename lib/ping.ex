defmodule Ping do
  use GenServer

  @timeout 5000
  @server __MODULE__

  # client api
  def start_link(opts \\ []) do
    {:ok, pid} = GenServer.start_link @server, [], opts
    Process.register pid, @server
  end

  def play, do: GenServer.call @server, :start
  def pause, do: GenServer.call @server, :pause

  # server
  def init(_args) do
    {:ok, :null, @timeout}
  end

  def handle_call(:start, _from, state) do
    {:reply, :started, state, @timeout}
  end

  def handle_call(:pause, _from, state) do
    {:reply, :paused, state}
  end

  def handle_info(:timeout, state) do
    IO.inspect {:erlang.time(), state}
    {:noreply, state, @timeout}
  end

end
