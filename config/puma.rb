port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }


# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
