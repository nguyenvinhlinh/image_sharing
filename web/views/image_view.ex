defmodule ImageSharing.ImageView do
  use ImageSharing.Web, :view

  def get_relative_url(image) do
    "/uploads/#{image.filename}"
  end

  def get_absolute_url(image) do
    Application.get_env(:image_sharing, :app_root_url) <> "/uploads/#{image.filename}"
  end
end
