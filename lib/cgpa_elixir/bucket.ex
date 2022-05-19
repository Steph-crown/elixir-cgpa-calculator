defmodule CgpaElixir.Bucket do
  use Agent

  @doc """
  Starts a new bucket with an empty map.
  """
  def start_link(_args) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the bucket using a key
  """
  def get(bucket, key) do
    # gets the key value from the bucket map
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts a key value pair in the bucket
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
    Deletes a key value pair from the bucket
  """
  def delete(bucket, key) do
    Agent.update(bucket, &Map.delete(&1, key))
  end
end
