defmodule ProkeepWeb.MessageControllerTest do
  use ProkeepWeb.ConnCase, async: true

  require Logger

  describe "when requests are sent to /receive-message" do
    test "GET requests with expected params are successful", %{conn: conn} do
      conn = get(conn, "/receive-message?queue=Widner&message=loves+Elixir")
      assert response(conn, 200) =~ "Success"
    end

    test "GET requests without expected query params will fail", %{conn: conn} do
      conn = get(conn, "/receive-message?first_name=Widner&quote=loves+Elixir")
      assert response(conn, 400) =~ "Bad Request"
    end

    test "requests that are not GET requests will fail", %{conn: conn} do
      assert_raise Phoenix.Router.NoRouteError, fn ->
        query_params = %{:queue => "Widner", :message => "loves Elixir"}
        post(conn, "/receive-message", query_params)
      end
    end
  end
end
