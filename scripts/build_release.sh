# This script is about to build release for application
export MIX_ENV=prod

mix local.hex --force;
mix local.rebar --force;
mix deps.get;
npm install;
bash ./node_modules/.bin/brunch build --production;
mix compile;
mix phoenix.digest;
mix release.init;
mix release --env=prod;
