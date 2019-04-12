use_sample_bpm :loop_compus, num_beats: 8

live_loop :compus do
  sample :loop_compus
  sleep 4
end

define :bd do |beats=0,amp=1|
  sample :drum_bass_hard, amp: amp
  sleep beats
end

define :sn do |beats=0,amp=1|
  sample :drum_snare_hard, amp: amp
  sleep beats
end

live_loop :droomz do
  bd 1
  sn 1
  bd 0.25
  bd 0.75, 0.5
  sn 1
end