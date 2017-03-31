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
    %{"image_data" => %Plug.Upload{content_type: content_type, filename: filename, path: tmp_path}} = image_data
    filename = ImageSharing.Utilities.generate_string <> filename
    save_location = Application.get_env(:image_sharing, :file_store_path)
    File.copy!(tmp_path, save_location <> "/" <> filename)
    image_changeset = Image.create_changeset(%Image{}, %{filename: filename})
    case Repo.insert(image_changeset) do
      {:ok, image} ->
        redirect(conn, to: image_path(conn, :show, image))
      {:error, changeset} ->
        redirect(conn, to: image_path(conn, :new))
    end
  end

  def create(conn, _) do
    conn
    |> put_flash(:alert, "No file choosen.")
    |> render("new.html")
  end
end
