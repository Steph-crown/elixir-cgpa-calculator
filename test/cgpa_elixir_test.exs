defmodule CgpaElixirTest do
  use ExUnit.Case
  doctest CgpaElixir

  # checks that the hello function returns world
  test "greets the world" do
    assert CgpaElixir.hello() == :world
  end
end
