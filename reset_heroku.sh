#!/bin/bash
heroku pg:reset --confirm rails_app-staging && heroku run rake db:migrate && heroku run rake db:seed_fu && heroku run rake db:seed
