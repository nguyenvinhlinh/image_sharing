FROM nguyenvinhlinh/fedora-elixir:1.4.0
ENV MIX_ENV=prod

COPY ./mix.exs /image_sharing/mix.exs
COPY ./mix.lock /image_sharing/mix.lock
COPY ./package.json /image_sharing/package.json
WORKDIR /image_sharing
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN dnf install nodejs-1:6.10.0-1.fc25 -y
RUN npm install

COPY . /image_sharing
WORKDIR /image_sharing
RUN node_modules/.bin/brunch build --production
RUN mix compile
RUN mix phoenix.digest
RUN mix release.init
RUN mix release  --env=prod

CMD bash /image_sharing/scripts/start_application_via_release.sh
expose 4000
