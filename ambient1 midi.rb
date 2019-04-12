# Ambient experiment for Sonic Pi (http://sonic-pi.net/)
#
# The piece consists of three long loops, each of which plays one of
# two randomly selected pitches. Each note has different attack,
# release and sleep values, so that they move in and out of phase
# with each other. This can play for quite awhile without
# repeating itself :)


live_loop :note1 do
  midi choose([:D4,:E4]), sustain: 6, vel: 80, channel: 1
  sleep 8
end

live_loop :note2 do
  midi choose([:Fs4,:G4]), sustain: 5, vel: 80, channel: 1
  sleep 10
end

live_loop :note3 do
  midi choose([:A4,:Cs5]), sustain: 5, vel: 80, channel: 1
  sleep 11
end

live_loop :note4 do
  note = choose([:D2,:E2, :A2])
  midi note, sustain: 11, vel: 80, channel: 1
  midi note, sustain: 11, vel: 80, channel: 2
  sleep 20
end