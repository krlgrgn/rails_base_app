# README

My application template with some default functionality like session management
and user CRUD.


To rename the project appropriately do:

- rails g rename:into RailsApp
- find ./ -type f -exec sed -i -e 's/karl_app/rails_app/g' {} \;

You'll probably have to remove some untracked files, to do that run:

git clean -fd
