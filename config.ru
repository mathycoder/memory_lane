require_relative './config/environment'
require 'sinatra/flash'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending.  Run 'rake db:migrate' to resolve the issue.'
# end

begin
  use Rack::MethodOverride
  use LanesController
  use UsersController
  use MemoriesController
  use RecollectionsController
  use ImagesController
  run ApplicationController
end
