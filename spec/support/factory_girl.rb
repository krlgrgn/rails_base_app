# This config means we don't have to use FactoryGirl.create
# we can justuse create.
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
