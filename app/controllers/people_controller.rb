class PeopleController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/html'
    @people = Person.all
  end

  def events
    response.headers['Content-Type'] = 'text/event-stream'
    $redis.subscribe 'update' do |on|
      on.message do |event, data|
        response.stream.write "data: #{data}\n\n"
      end
    end
  rescue IOError
    logger.info 'Stream closed'
  ensure
    response.stream.close
  end
end
