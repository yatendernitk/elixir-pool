defmodule Pooly do
  @moduledoc """
  Documentation for Pooly.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pooly.hello
      :world

  """
  def hello do
    :world
  end

  def start(_type, _args) do
    pool_config = [mfa: {Pooly.SampleWorker, :start_link, []}, size: 50000]
    start_pool(pool_config)
  end

  def start_pool(pool_config) do
    Pooly.Supervisor.start_link(pool_config)
  end

  def checkout do
    Pooly.Server.checkout()
  end

  def checkin(worker_pid) do
    Pooly.Server.checkin(worker_pid)
  end

  def status do
    Pooly.Server.status()
  end
end
