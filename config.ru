require_relative './config/environment'
#require 'sinatra/flash'

begin
  use Rack::MethodOverride
  use LanesController
  use UsersController
  use MemoriesController
  use RecollectionsController
  use ImagesController
  use UserLanesController
  run ApplicationController
end
