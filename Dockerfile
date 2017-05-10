FROM nguyenvinhlinh/fedora-elixir:1.4.0
RUN echo fastestmirror=true >> /etc/dnf/dnf.conf
ENV MIX_ENV=prod
COPY ./mix.exs /image_sharing/mix.exs
COPY ./mix.lock /image_sharing/mix.lock
COPY ./package.json /image_sharing/package.json
WORKDIR /image_sharing
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN dnf install nodejs -y
RUN npm install

COPY . /image_sharing
WORKDIR /image_sharing
RUN node_modules/.bin/brunch build --production
RUN mix compile
RUN mix phoenix.digest

CMD bash ./scripts/docker_start_application.sh
expose 4000
