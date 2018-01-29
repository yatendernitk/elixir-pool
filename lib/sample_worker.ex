defmodule Pooly.SampleWorker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  def init(state) do
    {:ok, state}
  end

  def stop(pid) do
    GenServer.call(pid, :stop)
  end

  def handle_call(:stop, _from, state) do
    {:stop, :normal, :ok, state}
  end

  def work_for(pid, duration) do
    GenServer.cast(pid, {:work_for, duration})
  end

  def handle_cast({:work_for, duration}, state) do
    IO.inspect "sleeping for 10 seconds"
    :timer.sleep(duration)
    IO.inspect "awake after 10 seconds"
    {:stop, :normal, state}
  end
end
