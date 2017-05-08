defmodule ImageSharing.ImageView do
  use ImageSharing.Web, :view

  def get_image_relative_url(image) do
    "/uploads/#{image.filename}"
  end

  def get_image_absolute_url(image) do
    Application.get_env(:image_sharing, :app_root_url) <> "/uploads/#{image.filename}"
  end

  def render("facebook-meta-tags", %{image: image, conn: conn}) do
    Phoenix.View.render(__MODULE__, "_facebook_meta_tags.html", [image: image, conn: conn])
  end

  def render("facebook-meta-tags", %{conn: conn}) do
    current_url = [Application.get_env(:image_sharing, :app_root_url) | conn.path_info]
    |> Path.join
    ImageSharing.ShareView.render("_facebook_meta_tags.html", [url: current_url])
  end
end
