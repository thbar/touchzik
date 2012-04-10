require 'bundler'
Bundler.setup

require 'faye'
require './faye_midi_relay'

# to avoid starting 2 apps, use the Faye ability to be mounted as a rack middleware
use Faye::RackAdapter,
  :mount => '/faye',
  :timeout => 32,
  :extensions => [FayeMIDIRelay.new]

require './application'

run TouchZik