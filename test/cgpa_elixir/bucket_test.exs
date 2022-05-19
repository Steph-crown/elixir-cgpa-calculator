defmodule CgpaElixir.BucketTest do
  use ExUnit.Case, async: true

  # checks that the bucket stores value by key
  test "stores the values by key" do
    # starts the agent
    {:ok, bucket} = CgpaElixir.Bucket.start_link([])

    # tries to access a non existent key
    assert CgpaElixir.Bucket.get(bucket, "name") == nil

    # puts a key value pair in the bucket
    CgpaElixir.Bucket.put(bucket, "name", "stephen emmanuel")

    # tries to access the key
    assert CgpaElixir.Bucket.get(bucket, "name") == "stephen emmanuel"
  end
end
