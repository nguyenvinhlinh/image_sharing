defmodule :release_tasks do
  def migrate_db do
    {:ok, _} = Application.ensure_all_started(:image_sharing)
    path = Application.app_dir(:my_app, "priv/repo/migrations")
    #repo = Application.get_env(:image_sharing, ImageSharing.Repo)
    
    Ecto.Migrator.run(ImageSharing.Repo, path, :up, all: true)
  end
end
