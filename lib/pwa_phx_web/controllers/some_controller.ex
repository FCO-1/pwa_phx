defmodule PwaPhxWeb.SomeController do
  use PwaPhxWeb, :controller

  def service_worker(conn, _) do
    conn
    |> put_resp_content_type("application/javascript")
    |> render("service_worker.js")
  end

end
