defmodule ImageSharing.Endpoint do
  use Phoenix.Endpoint, otp_app: :image_sharing

  socket "/socket", ImageSharing.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :image_sharing, gzip: false,
    only: ~w(css js image)

  plug Plug.Static,
    at: "/uploads",
    from: Application.get_env(:image_sharing, :file_store_path)
  
  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_image_sharing_key",
    signing_salt: "5b0nEmVw"

  plug ImageSharing.Router
end
