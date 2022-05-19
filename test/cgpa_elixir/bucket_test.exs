defmodule CgpaElixir.BucketTest do
  use ExUnit.Case, async: true

  #   sets up spinning of the bucket
  # so we dont spin it in every single tests
  setup do
    {:ok, bucket} = CgpaElixir.Bucket.start_link([])
    %{bucket: bucket}
  end

  # checks that the bucket stores value by key
  test "stores the values by key", %{bucket: bucket} do
    # tries to access a non existent key
    assert CgpaElixir.Bucket.get(bucket, "name") == nil

    # puts a key value pair in the bucket
    CgpaElixir.Bucket.put(bucket, "name", "stephen emmanuel")

    # tries to access the key
    assert CgpaElixir.Bucket.get(bucket, "name") == "stephen emmanuel"

    # delete a key from the bucket
    CgpaElixir.Bucket.delete(bucket, "name")

    # tries to access the key
    assert CgpaElixir.Bucket.get(bucket, "name") == nil
  end
end
