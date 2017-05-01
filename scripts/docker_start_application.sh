# This is script to run phoenix application via phoenix task phoenix.server
# This script requires following system variables:
#      - MIX_ENV=prod
#      - APP_PORT=4000
#      - APP_DOMAIN_NAME=image.hexalink.xyz
#      - APP_ROOT_URL=http://image.hexalink.xyz:4000
#      - APP_FILE_STORE_PATH=/tmp
#      - DATABASE_HOSTNAME=hexalink_postgres_database
#      - DATABASE_PORT=5432
#      - DATABASE_NAME=image_sharing_db
#      - DATABASE_USERNAME=nguyenvinhlinh
#      - DATABASE_PASSWORD=nguyenvinhlinh
# For example:
# export APP_PORT=4000
# export MIX_ENV=prod
# export APP_DOMAIN_NAME=image.hexalink.xyz
# export APP_ROOT_URL=http://image.hexalink.xyz:4000
# export APP_FILE_STORE_PATH=/tmp
# export DATABASE_HOSTNAME=localhost
# export DATABASE_PORT=15432
# export DATABASE_NAME=image_sharing_db
# export DATABASE_USERNAME=nguyenvinhlinh
# export DATABASE_PASSWORD=nguyenvinhlinh

mix ecto.create;
mix ecto.migrate;
mkdir $APP_FILE_STORE_PATH;
mix phoenix.server;
