# Ambient Orchestral

# Coded by Darin Wilson

use_random_seed 20190408
use_bpm 90

conductor = {}

define :conduct do |players|
  print "now playing: #{players}"
  conductor = {
    soprano_play: players.include?(:soprano),
    alto_play:    players.include?(:alto),
    tenor_play:   players.include?(:tenor),
    bass_play:    players.include?(:bass),
    brass_play:   players.include?(:brass)
  }
end

conduct [:soprano, :alto, :tenor, :bass, :brass]

live_loop :soprano do
  midi choose([:C5, :D5, :E5, :G5]), sustain: 16, vel: 80, channel: 3 if conductor[:soprano_play]
  sleep choose(range 24, 30)
end

live_loop :alto, delay: 24 do
  midi choose([:F4, :G4, :A4, :Bb4]), sustain: 18, vel: 80, channel: 3 if conductor[:alto_play]
  sleep choose(range 28, 36)
end

live_loop :tenor, delay: 48 do
  midi choose([:A3, :Bb3, :C4, :D4, :E4]), sustain: 16, vel: 80, channel: 4 if conductor[:tenor_play]
  sleep choose(range 26, 30)
end

live_loop :bass, delay: 60 do
  midi choose([:F2, :G2, :Bb2, :C3, :D3]), sustain: 30, vel: 80, channel: 4 if conductor[:bass_play]
  sleep choose(range 34, 44)
end

live_loop :brass, delay: 84 do
  note = choose [:F1, :Bb1, :C1, :D1]
  midi note, sustain: 24, vel: 80, channel: 2 if conductor[:brass_play]
  midi note + 12, sustain: 24, vel: 80, channel: 2 if conductor[:brass_play]
  sleep choose(range 66, 76)
end

sleep 100
conduct [:alto, :tenor, :bass]
sleep 50
conduct [:soprano, :alto, :tenor]




