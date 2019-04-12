use_sample_bpm :loop_compus, num_beats: 8

live_loop :compus do
  with_fx :reverb, room: 0.8, mix: 0.5 do
    sample :drum_bass_hard
    sample :loop_compus, rate: 0.5, amp: 0.75
    sleep 8
  end
end

pitch = 7
live_loop :hum do
  with_fx :reverb, room: 0.9, mix: 0.75 do
    with_fx :pitch_shift, mix: 0.5, pitch: pitch do
      sample :ambi_glass_hum
      sleep 6
      pitch = [5, 7, 8, 10].choose if one_in(3)
    end
  end
end

live_loop :bell do
  use_synth :pretty_bell
  with_fx :reverb, room: 0.9, mix: 0.95 do
    with_fx :echo, mix: 0.6, phase: 0.75, decay: 7 do
      play scale(60, :major_pentatonic, num_octaves: 3).choose, amp: 0.1
      sleep [6, 8, 10].choose
    end
  end
end