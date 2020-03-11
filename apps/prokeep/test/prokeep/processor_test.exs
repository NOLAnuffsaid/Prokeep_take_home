defmodule Prokeep.ProcessorTest do
  use ExUnit.Case

  alias Prokeep.Processor

  describe "Processor.add_message/1" do
    test "should store valid messages passed as parameters" do
      assert :ok == Processor.add_message "Widner is awesome"
    end
  end
end
