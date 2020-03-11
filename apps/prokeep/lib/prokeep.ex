defmodule Prokeep do

  alias Prokeep.Processor

  @moduledoc """
  ProkeepTest keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @spec process_msg(binary(), binary()) :: :error | :ok
  def process_msg(_, msg)
      when is_binary(msg) do
    Processor.add_message(msg)
  end

  def process_msg(_, _), do: :error
end
