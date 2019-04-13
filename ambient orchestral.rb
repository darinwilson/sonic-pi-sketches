# Ambient Orchestral

# Coded by Darin Wilson

use_random_seed 20190408
use_bpm 90

alto_intro = true
tenor_intro = true
bass_intro = true
brass_intro = true
live_loop :soprano do
  midi choose([:C5, :D5, :E5, :G5]), sustain: 16, vel: 80, channel: 3
  sleep choose(range 24, 30)
end

live_loop :alto do
  if alto_intro
    sleep 24
    alto_intro = false
  end
  
  midi choose([:F4, :G4, :A4, :Bb4]), sustain: 18, vel: 80, channel: 3
  sleep choose(range 28, 36)
end

live_loop :tenor do
  if tenor_intro
    sleep 48
    tenor_intro = false
  end
  
  midi choose([:A3, :Bb3, :C4, :D4, :E4]), sustain: 16, vel: 80, channel: 4
  sleep choose(range 26, 30)
end

live_loop :bass do
  if bass_intro
    sleep 60
    bass_intro = false
  end
  
  midi choose([:F2, :G2, :Bb2, :C3, :D3]), sustain: 30, vel: 80, channel: 4
  sleep choose(range 34, 44)
end

live_loop :brass do
  if brass_intro
    sleep 84
    brass_intro = false
  end
  
  note = choose [:F1, :Bb1, :C1, :D1]
  midi note, sustain: 24, vel: 80, channel: 2
  midi note + 12, sustain: 24, vel: 80, channel: 2
  sleep 66
end

