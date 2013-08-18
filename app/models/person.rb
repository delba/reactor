class Person < ActiveRecord::Base
  before_update do
    $redis.publish 'update', to_json(only: [:id, *changed])
  end
end
