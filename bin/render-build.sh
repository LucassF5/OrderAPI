# #!/usr/bin/env bash
# set -o errexit

# bundle install
# bundle exec rails assets:precompile
# bundle exec rails assets:clean


#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake db:migrate
