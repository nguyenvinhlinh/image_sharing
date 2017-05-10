use Mix.Config

config :image_sharing, ImageSharing.Endpoint,
  secret_key_base: "eUvA+JfaJPyqipwuNV/Td/TQK/t9xTB2aEVGO+PtVQHFDCShazH0DCd2G7A8zx49"

# Configure your database
config :image_sharing, ImageSharing.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: System.get_env("DATABASE_HOSTNAME") || "${DATABASE_HOSTNAME}",
  database: System.get_env("DATABASE_NAME") || "${DATABASE_NAME}",
  username: System.get_env("DATABASE_USERNAME") || "${DATABASE_USERNAME}",
  password: System.get_env("DATABASE_PASSWORD") || "${DATABASE_PASSWORD}",
  port: System.get_env("DATABASE_PORT") || "${DATABASE_PORT}",
  pool_size: 20

# Config the website domain name
config(:image_sharing, ImageSharing.Endpoint,
  domain_name: "http://localhost:4000")

# Config the path which store image on harddrive
config(:image_sharing, :file_store_path,
  System.get_env("APP_FILE_STORE_PATH") || "${APP_FILE_STORE_PATH}")
config(:image_sharing, :app_root_url,
  System.get_env("APP_ROOT_URL") || "${APP_ROOT_URL}")

# Config facebook app_id
config(:image_sharing, :facebook_app_id,
  System.get_env("FACEBOOK_APP_ID") || "${FACEBOOK_APP_ID}")
