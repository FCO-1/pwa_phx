defmodule PwaPhxWeb.SomeController do
  use PwaPhxWeb, :controller

  def sw(conn, _) do
    conn
    |> put_resp_content_type("application/javascript")
    |> render("sw.js")
  end

end
