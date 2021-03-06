defmodule ImageSharing.ImageController do
  use ImageSharing.Web, :controller
  alias ImageSharing.Model.Image
  alias ImageSharing.Utilities

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def random_image(conn, _) do
    query = "Select id, filename, inserted_at from images order by random() limit 1";
    result = Ecto.Adapters.SQL.query!(Repo, query, [])
    %{rows: rows} = result
    if rows == [] do
      conn
      |> put_flash(:error, "There are no images")
      render(conn, "index.html")
    else
      row = List.first(rows)
      [id, filename, inserted_at] = row
      image = %Image{id: id, filename: filename, inserted_at: Ecto.DateTime.cast!(inserted_at)}
      render(conn, "show.html", image: image)
    end
  end
  
  def show(conn, %{"id" => id}) do
    image = Repo.get(Image, id)
    render(conn, "show.html", image: image)
  end
  
  def new(conn, _params) do
    render(conn, "new.html")
  end
  
  def create(conn, %{"upload_image" => image_data}) do
    %{"image_data" => %Plug.Upload{content_type: _content_type, filename: filename, path: tmp_path}} = image_data
    filename = Utilities.generate_string <> filename
    save_location = Application.get_env(:image_sharing, :file_store_path)
    File.copy!(tmp_path, save_location <> "/" <> filename)
    image_changeset = Image.create_changeset(%Image{}, %{filename: filename})
    case Repo.insert(image_changeset) do
      {:ok, image} ->
        redirect(conn, to: image_path(conn, :show, image))
      {:error, _changeset} ->
        redirect(conn, to: image_path(conn, :new))
    end
  end

  def create(conn, _) do
    conn
    |> put_flash(:alert, "No file choosen.")
    |> render("new.html")
  end

  def get_upload_file(conn, %{"file_name" => file_name}) do
    upload_store_path = Application.get_env(:image_sharing, :file_store_path)
    absolute_upload_file_path = Path.join([upload_store_path, file_name])
    content_type = conn.path_info
    |> List.last
    |> MIME.from_path

    conn
    |> Plug.Conn.put_resp_header("content-type", content_type)
    |> Plug.Conn.put_resp_header("cache-control", "public")
    |> Plug.Conn.delete_resp_header("x-frame-options")
    |> Plug.Conn.delete_resp_header("x-xss-protection")
    |> Plug.Conn.delete_resp_header("x-content-type-options")
    |> Plug.Conn.send_file(200, absolute_upload_file_path)
    |> halt
  end
end
