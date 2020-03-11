defmodule Prokeep.ProkeepTest do
  use ExUnit.Case

  describe "Prokeep.process_msg/2" do
    test "returns :ok when passed valid parameters" do
      assert :ok == Prokeep.process_msg("Widner", "loves Elixir")
    end

    test "returns :error when passed invalid parameters" do
      assert :error == Prokeep.process_msg(123, 456)
    end
  end
end
