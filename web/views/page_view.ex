defmodule ImageSharing.PageView do
  use ImageSharing.Web, :view

  def render("facebook-meta-tags", %{conn: conn}) do
    current_url = [Application.get_env(:image_sharing, :app_root_url) | conn.path_info]
    |> Path.join
    ImageSharing.ShareView.render("_facebook_meta_tags.html", [url: current_url])
  end
end
