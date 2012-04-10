### Story

I wanted to see how to generate midi events programmatically in Ruby and came across UniMIDI, while playing music with my son.

While researching that, I thought that chaining that with some touches from an iPad could lead to interesting things.

The latency is surprinsigly low, which opens interesting potential :)

This project hosts the first bits of code of that.

### Building blocks

* sinatra serves the html app
* faye maintains a bi-directional socket
* kinetics is used for quick javascript shapes
* unimidi allows to interact with the midi hardware

### Immediate future

This is a quick hack with my son during easter week-end: don't expect many updates, as I'm hard at work on https://www.wisecashhq.com.

That said please hack around and send back anything you'd want to share!

### How to use

* make sure you have one midi output (as reported by `UniMIDI::Output.all') and connect it to something (ie: a real synth, or create an IAC setup to route it to Renoise or similar)
* `bundle install`
* `thin start -R config.ru` (don't use webrick)
* open your browser on the iPhone to the correct host and port

You should then see squares and you should be able to touch them to play the music.

Please don't touch more than one pad at once! Multi-touch is not yet supported.

### Tested on

Mac OS X.

### TODO

* support multi-touch
* mix stuff with midi-topaz to provide tempo manipulation
  * push back the current beat/bar to the web clients
  * track down some state to create patterns
* implement more stuff like in propellerheads "figure"
* ...

### License

MIT

### Author

[Thibaut Barrère](http://twitter.com/thibaut_barrere)