defmodule ImageSharing.Plug.StaticUploadAsset do
  def init(args) do
    args
  end

  def call(conn, _) do
    Plug.Static.call(conn,
      %{
        at: "/uploads",
        only: [],
        from: Application.get_env(:image_sharing, :file_store_path),
        prefix: [],
        gzip?: false,
        brotli?: false
      }
    )
  end
end
