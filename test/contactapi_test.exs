defmodule ContactapiTest do
  use ExUnit.Case
  doctest Contactapi

  test "greets the world" do
    assert Contactapi.hello() == :world
  end
end
