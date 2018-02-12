#https://github.com/samaaron/sonic-pi/blob/master/etc/doc/tutorial/08.5-Ring-Chains.md

use_bpm 120

baseTime = 0.5

use_real_time
loopCount = 0

live_loop:main do
  
  noteArray = [46, 49, 51, 48, 50].ring
  
  5.times do
    bassLoop noteArray[loopCount]
    sleep baseTime
  end
  
  print loopCount
  print noteArray[loopCount]
  
  loopCount = loopCount + 1
  
end

define :bassLoop do | noteNum |
  use_synth :fm
  
  with_fx :reverb do
    play noteNum, amp: 1.85 ,attack: 0.01,
      decay: 0.05, sustain: 0.125, release: 0.4
    use_synth :saw
  end
  
  use_synth :tri
  with_fx :reverb do
    play noteNum, amp: 1.25 ,attack: 0.01,
      decay: 0.05, sustain: 0.125, release: 0.4 , cutoff: 65
  end
  
end
