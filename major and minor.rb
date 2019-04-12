use_sample_bpm :loop_amen, num_beats: 4

live_loop :dnb do
  sample :bass_dnb_f
  sample :loop_amen
  sleep 4
  sample :bass_hard_c, amp: 0.5
  sample :loop_amen
  sleep 4
end

live_loop :pings do
  use_synth :tb303
  with_fx :flanger do
    scale_type = (ring :minor, :major)[tick]
    (32*4).times do
      play scale(:f3, scale_type).choose, amp: 0.5, release: 0.25
      sleep 0.25
    end
  end
end