
use_bpm 120
loopCount = 0

live_loop:main do
  
  drm
  
  sleep 0.5
  
end


define :drm do
  
  cymArray = [1, 0, 1, 0, 1, 0, 1, 1]
  snrArray = [0, 1, 0, 0, 0, 1, 0, 1]
  kikArray = [0, 0, 1, 0, 0, 0, 1, 1]
  
  for num in 0..7 do
      
      if cymArray[num] == 1 then
        sample :drum_cymbal_closed, amp: 0.95
      end
      
      if snrArray[num] == 1 then
        sample :drum_snare_soft, amp: 0.99
      end
      
      if kikArray[num] == 1 then
        sample :drum_heavy_kick, amp: 2.0
      end
      
      sleep 0.5
    end
    
  end
  
  