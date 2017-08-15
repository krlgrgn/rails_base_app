#!/bin/bash
heroku pg:reset --confirm duomojo-staging && heroku run rake db:migrate && heroku run rake db:seed_fu && heroku run rake db:seed
