# Ambient experiment for Sonic Pi (http://sonic-pi.net/)
#
# The piece consists of four long loops, each of which plays one of
# a few randomly selected pitches. Each note has different attack,
# release and sleep values, so that they move in and out of phase
# with each other. This can play for quite awhile without
# repeating itself :)

use_synth :hollow

live_loop :note1 do
  with_fx :reverb, mix: 0.7 do
    play choose([:b3,:d4,:e4]), attack: 6, release: choose([6,7,8])
    sleep 12
  end
end

live_loop :note2 do
  with_fx :reverb, mix: 0.7 do
    play choose([:fs4,:g4]), attack: 4, release: choose([5,6])
    sleep 9
  end
end

live_loop :note3 do
  with_fx :reverb, mix: 0.7 do
    play choose([:a4, :b4, :a4, :b4, :cs5]), attack: 5, release: choose([5,6,7])
    sleep 10
  end
end

live_loop :note4 do
  with_fx :reverb, mix: 0.7 do
    play choose([:d3, :g3, :a3]), attack: 10, release: choose([10,12,14])
    sleep choose([28, 36, 44])
  end
end