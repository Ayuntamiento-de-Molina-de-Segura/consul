set :branch, ENV["branch"] || :main

server main_deploy_server, user: deploysecret(:user), roles: %w[web app db importer cron background]
