require 'unimidi'
require 'ap'

# Using a server extension will likely provide a better
# latency compared to a regular faye client - TODO test
class FayeMIDIRelay
  SOUND_MAPPING = {
    'touchstart' => 0x90,
    'touchend' => 0x80
  }

  def midi_output
    @midi_output ||= UniMIDI::Output.all.first
  end

  def incoming(message, callback)
    if message['channel'] == '/sound'
      data = message['data']
      ap data
      
      action = SOUND_MAPPING[data['event']]
      scale = [0, 4, 7, 11]

      octave = data['pad'] / scale.size
      note = 36 + 12 * octave + (scale[data['pad'] % (scale.size)])

      midi_output.puts(action, note, 70)
    end
    callback.call(message)
  end
end
