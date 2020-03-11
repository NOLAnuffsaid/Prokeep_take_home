defmodule ProkeepWeb.MessageController do
  use ProkeepWeb, :controller

  alias Plug.Conn

  def receive_message(
        %Conn{
          :query_params => %{
            "message" => msg,
            "queue" => q
          }
        } = conn,
        _params
      ) do
    Task.start(fn -> Prokeep.process_msg(q, msg) end)
    respond(conn, :ok)
  end

  def receive_message(conn, _), do: respond(conn, :error)

  defp respond(conn, :ok), do: Conn.resp(conn, 200, "Success")
  defp respond(conn, :error), do: Conn.resp(conn, 400, "Bad Request")
end
