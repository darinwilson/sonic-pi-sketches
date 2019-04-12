notes = (scale :eb1, :scriabin, num_octaves: 2)
live_loop :beeps do
  use_synth :tb303
  play notes.choose, release: 0.125
  sleep 0.125
end

live_loop :bass do
  cue :droomz
  use_synth :saw
  play :eb2, release: 2
  sleep 4
end

chord_notes = (scale :eb4, :scriabin, num_octaves: 1)
live_loop :chords do
  cue :droomz
  sleep 0.25
  play [chord_notes.choose, chord_notes.choose, chord_notes.choose], release: 0.125
  sleep 0.25
end

tick
live_loop :droomz do
  with_fx :flanger do
    sample :bd_haus
    sleep 0.5
    if tick == 1
      sample :sn_dub
      tick_reset
    end
  end
end

live_loop :hat do
  cue :droomz
  sample :drum_cymbal_closed
  sleep 0.25
end