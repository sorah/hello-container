require 'bundler/setup'
require 'socket'
require 'revision_plate'

hostname = Socket.gethostname

use RevisionPlate::Middleware, '/site/sha', "#{__dir__}/REVISION"

map '/' do
  run proc { |_e| [200, {'Content-Type' => 'text/plain'}, ["Hello from #{hostname}\n"]] }
end

run proc { |_e| [404, {'Content-Type' => 'text/plain'}, ["404\n"]] }
