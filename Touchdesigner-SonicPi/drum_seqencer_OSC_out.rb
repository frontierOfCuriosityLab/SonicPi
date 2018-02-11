
use_bpm 120
loopCount = 0
baseTime = 0.5

use_osc "localhost", 12345
use_real_time

live_loop:main do
  drm
  sleep baseTime
end

isFirstLoop = 0
define :drm do
  
  live_loop:drumLoop do
    
    cymArray = [0, 1, 0, 0, 0, 1, 0, 1]
    snrArray = [0, 0, 0, 1, 0, 0, 0, 1]
    kikArray = [0, 0, 0, 0, 1, 0, 0, 1]
    
    for num in 0..7 do
        
        if cymArray[num] == 1 then
          sample :drum_cymbal_closed, amp: 0.95
        end
        
        if snrArray[num] == 1 then
          sample :drum_snare_hard, amp: 0.75
        end
        
        if kikArray[num] == 1 then
          sample :drum_heavy_kick, amp: 2.6
        end
        
        drm_stat = [cymArray[num], snrArray[num], kikArray[num]]
        currentFrame = num.to_s
        drm_prpnd = "/sonicpi/drm" + currentFrame + "/"
        drmdata = drm_prpnd + drm_stat.to_s
        osc drmdata
        sleep baseTime
      end
    end
    
    live_loop :drm_stat do
      if isFirstLoop == 0 then
        sleep baseTime * 0.5
        isFirstLoop = 1
      end
      isFirstLoop.to_s
      osc "/sonicpi/drmReset/[0, 0, 0]"
      sleep baseTime
    end
    
  end
  
  
