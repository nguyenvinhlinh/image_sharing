# ImageSharing
## To developing
  * Clone and configure dev.exs from `dev.exs.sample`  
  * Start dev server with command: `mix phoenix.server`  
## To deploy your server
### List of system variables and definition:
  * APP_PORT: the port that application is running
  * MIX_ENV=prod: the environment running application (must be `prod` to deploy)
  * APP_DOMAIN_NAME: the domain name of system, for example: image.hexalink.xyz
  * APP_ROOT_URL: the root url, for example: http://image.hexalink.xyz:4000 
  * APP_FILE_STORE_PATH: place to store upload image on hard drive, for example: /tmp
  * DATABASE_HOSTNAME: self-explanatory
  * DATABASE_PORT: self explained
  * DATABASE_NAME: self explained
  * DATABASE_USERNAME: self explained
  * DATABASE_PASSWORD: self explained
  * REPLACE_OS_VARS: Only need when start released application, which aims at replace configuration at `prod.secret.exs` with system variables.
### Deploy with docker
1. Copy the file Docker-compose.prod.yaml to a particular directory at deploy machine
2. Take care the image_sharing:tag, the tag might not be updated to latest version
2. Run docker-compose up -d
### Deploy with phoenix task (phoenix.server)
1. Git clone to the deploy machine 
2. Make sure database server started with and you got enough information: database_host, database_port, database_name, username, password
2. Edit the file `/scripts/start_application_via_phoenix_task.sh`
3. After edit system environment variables, run `bash ./scripts/start_application_via_phoenix_task.sh`
