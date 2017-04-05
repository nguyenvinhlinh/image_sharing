FROM fedora-elixir:1.4.0

ENV MIX_ENV=prod
ENV APP_PORT=4000
ENV APP_DOMAIN_NAME=image.hexalink.xyz
ENV APP_ROOT_URL=http://image.hexalink.xyz:4000
ENV APP_FILE_STORE_PATH=/tmp
ENV DATABASE_HOSTNAME=hexalink_postgres_database
ENV DATABASE_PORT=5433
ENV DATABASE_NAME=image_sharing_db
ENV DATABASE_USERNAME=nguyenvinhlinh
ENV DATABASE_PASSWORD=nguyenvinhlinh
ENV RELX_REPLACE_OS_VARS=true
RUN mix local.hex --force
RUN dnf install nodejs-1:6.10.0-1.fc25 -y

COPY . /image_sharing
WORKDIR /image_sharing
RUN mix deps.get
RUN npm install
RUN node_modules/.bin/brunch build --production
RUN mix compile
RUN mix phoenix.digest
RUN mix release

#CMD sleep 5 && \
#    /image_sharing/rel/image_sharing/bin/image_sharing foreground

CMD /image_sharing/rel/image_sharing/bin/image_sharing foreground;
expose 4000
