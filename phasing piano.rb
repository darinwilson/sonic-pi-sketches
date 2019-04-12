# Phasing Piano, coded by Darin Wilson
# inspired by Steve Reich's Clapping Music
#
# This piece consists of two threads, each playing the same short melodic phrase.
#
# On every third pass through the phrase, one of the threads shifts the phase by
# 1/4 of a beat, moving it more and more out of phase. Eventually, it comes
# back around to where it started, and the piece ends.

use_synth :piano

use_bpm 92

define :play_phrase do
  play 72, amp: 1
  sleep 0.25
  play 70, amp: 0.75
  sleep 0.25
  play 72, amp: 1
  sleep 0.5
  play 67, amp: 1
  sleep 0.25
  play 65, amp: 0.5
  sleep 0.5
  play 70, amp: 1
  sleep 0.5
  play 62, amp: 0.75
  sleep 0.25
  play 60, amp: 1
  sleep 0.25
end

# this thread plays the phrase consistently
with_fx :pan, pan: -0.5 do
  in_thread(name: :steady) do
    40.times do
      play_phrase
      sleep 0.25
    end
  end
end

# this thread shifts the phrase 1/4 beat later on every 3rd pass
with_fx :pan, pan: 0.5 do
  in_thread(name: :phasing) do
    13.times do
      3.times do |count|
        play_phrase
        # last time, wait an extra 0.25 before starting the phrase again
        sleep (count == 2 ? 0.5 : 0.25)
      end
      puts "SHIFT!"
    end
  end
end