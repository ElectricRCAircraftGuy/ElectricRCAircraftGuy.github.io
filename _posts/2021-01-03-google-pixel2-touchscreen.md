---
published: true  # use "false" while drafting articles just before publishing
title: One possible fix for your Google Pixel 2 if the touch screen quits working
excerpt: "# The problem: phone touch screen randomly quit working

My Google Pixel 2's touch screen suddenly stopped working. **The screen itself works fine and shows everything perfectly, but the _touch_ sensor is not working _anywhere_ on the phone screen!**"
tags: 
  - phone repairs
  - life skills
# date: 1999-12-31
# last_modified_at: 2000-12-31  # updates the "Updated" date at the bottom!
# permalink: /test/
# redirect_from: 
# categories: 
toc: true  # (default for Table of Contents is true)
---


[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgabrielstaples.com%2Fgoogle-pixel2-touchscreen%2F&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=views+%28today+%2F+total%29&edge_flat=false)](https://hits.seeyoufarm.com)


# The problem: phone touch screen randomly quit working

My Google Pixel 2's touch screen suddenly stopped working. **The screen itself works fine and shows everything perfectly, but the _touch_ sensor is not working _anywhere_ on the phone screen!** It cannot detect my touch gestures. I was actively using my phone and noticed the battery was at 1%, so I quickly plugged it in. I was too late, however. As I plugged it in, it started to turning off due to low battery, and it did an automatic soft (proper) shutdown. With it now plugged in and charging, I turned it right back on and attempted to type my unlock password. No luck. The touch screen wouldn't respond! 

I held down the power button for like 10 seconds or so until it automatically did a reboot and I saw the "Google" name in color on the screen again, indicating it was turning back on. The touch screen was still totally unresponsive. I did this about 9 or 10 more times over the next 45 minutes--each time unresponsive. 

**How can I make the touchscreen work again?** 


# The fix (for my particular case)

I got it to work again! 

## What DID work for me: _press down on the screen with both thumbs_ to ensure the _screen connector (circled in yellow below) is in firmly_, and the _capacitive touch grounding strip (circled in cyan below) is in good contact_ with the phone's ground plane.

I am a DIY kind of person. I replaced my battery and screen myself a few months ago, following [these battery replacement instructions][1], and [these screen replacement instructions][2]. 

When I was done, my phone worked perfectly with zero problems until today. After many hard phone reboots by holding down the power button, with no success to get my touch screen working again, I remembered [this image][3]:

[![enter image description here][5]][3]

...from [this tutorial](https://www.ifixit.com/Guide/Google+Pixel+2+Battery+Replacement/103334). This is what the phone looks like just underneath the screen and touch panel under the screen. Notice the connector I circled yellow in the image above, and the rectangular grounding strip I circled in cyan underneath it. The yellow-circled item is the connector for the screen and touch sensor to connect to the phone, and the cyan-circled one is the grounding pad for the capacitive touch sensor. The connector has a plate/cover on top of it ([shown here][6]) which screws down to hold the connector in place, so it is unlikely to move or lose contact, but perhaps may. The cyan-circled grounding pad is likely very critical to the phone's touch sensor operation, since personal electronics experience making capacitive touch sensors work with Arduinos (ex: see the touch lamp video at the top of [my website article here](https://www.electricrcaircraftguy.com/2014/01/the-power-of-arduino.html)) teaches me that capacitive touch is _very sensitive_ to grounding issues. 

**I thought maybe pressing on that connector and grounding pad would help (truth be told: I actually was just thinking about the connector, and had forgotten about the grounding pad until _after_ I had done this). So, I pressed firmly but carefully down on the top of the screen near that connector, and then near that grounding pad. I then repeated this process, pressing with both thumbs, moving down the screen lower and lower from on top of that connector and down, until I reached about 1 inch from the bottom of the phone. I couldn't remember where the connector was exactly at the time, so I pressed in these several places, with both thumbs at once. Then, I tried the phone again. Voilà! Magically it worked! Touch sensor seems fine now.** It must have just re-seated that connector better is all, or: even more likely: regrounded the metallic strip from the capacitive touch sensor to that grounding pad circled in cyan/bluish. _I hypothesize that the adhesive-attached grounding strip connected to that pad had come loose, so that the instant I touched my charge cable to the phone to charge it, the electrical potential of the phone's ground got altered (charged or discharged) by the charge cable's ground, causing the capacitive touch to quit working. Re-grounding the capacitive touch grounding cable to that ground pad underneath the screen must have fixed the capacitive touch sensing system (I think)!_

If this doesn't last long-term, I'll buy [this replacement screen again for $40](https://www.diymobilerepair.com/google-pixel-2-lcd-touch-screen-replacement) (same one I bought before and have on the phone now) and replace it again (note: I used [this iFixit toolkit][7] and [this iFixit iOpener heating pad][8]--this heating pad is waaay safer and better than a heat gun!). 

If this "pressing on the center of the screen trick", followed by another screen replacement, doesn't last, I'll upgrade to the latest brand new Google Pixel. But, I really hope to hold off for 2 more years or so to get the full life out of my current one (goal is to replace my phone only every 4 years). 

## Other notes (ex: the phone can be used withOUT the touch screen, using a standard keyboard and mouse)

### 1. Use the phone withOUT the touch screen by using a USB OTG adapter and standard computer mouse (and optionally: keyboard too)

Note: if you need to use the phone until you can replace it, I was able to plug in a standard mouse into the phone with an OTG (On The Go) USB adapter and continue to use it just fine, albeit it was a pain of course. 

Here's some good OTG adapters that will work. You can plug in a standard USB hub into the USB port on the OTG adapter if you want to use both a computer keyboard and mouse at once. Once you plug in the mouse and begin moving it, a cursor will show up on your phone just like on a regular computer. I was able to type with the mouse too just by clicking on the visual keyboard in place of touching it. A keyboard, of course, would be better.

1. [USB C OTG adapter with charging port AND USB plug, $12][9] 
1. [Standard USB C OTG adapter, 3 pcs, $8][10]
1. Or, if you have a micro USB OTG adapter already on-hand, you can convert it to USB C with one of these: [micro USB to USB C adapter, 8 pcs, $7][11]. This is what I did. 

### 2. Try rebooting into "safe mode" too to see if the touch screen problem is somehow software-based

Once I had my mouse plugged into my phone so I could click around, I was able to reboot into safe mode to see if the problem might have been software-based and due to an interfering app or something. 

[Here's how I rebooted into safe mode][12], again, using my computer mouse and OTG adapter to click on the phone since the touch screen wasn't working:

1. Press and hold the power button until the power/reboot screen comes up.
1. Tap (click with the mouse) and **hold** the power off icon until it gives you a safe mode reboot option.
1. Choose the safe mode option and wait for the device to reboot. 

Safe mode didn't fix the touch screen problem, making me think it was probably a hardware issue. That's when I found the "fix" above by pressing on the center of the phone screen to jostle the hardware and apparently re-seat the connector, or (more likely) re-ground the capacitive touch sensor to the phone's ground, or something. 

# Other References
1. This article also posted as a Q&A on the Android Enthusiasts Stack Exchange here: [Android Enthusiasts Stack Exchange: My Google Pixel 2's touch screen suddenly quit working--how can I fix it?](https://android.stackexchange.com/questions/232564/my-google-pixel-2s-touch-screen-suddenly-quit-working-how-can-i-fix-it).


  [1]: https://www.ifixit.com/Guide/Google+Pixel+2+Battery+Replacement/103334
  [2]: https://www.ifixit.com/Guide/How+to+Replace+a+Google+Pixel+2+Screen/103077
  [3]: https://d3nevzfk7ii3be.cloudfront.net/igi/RSYXSBeeSGreK1tU.huge
  [4]: https://i.stack.imgur.com/GsyFB.jpg
  [5]: https://i.stack.imgur.com/EJMGA.jpg
  [6]: https://d3nevzfk7ii3be.cloudfront.net/igi/HuntXSUMrTQOPvUT.huge
  [7]: https://amzn.to/3naOReu
  [8]: https://amzn.to/3ni7UUg
  [9]: https://amzn.to/2JMAdwk
  [10]: https://amzn.to/2KX5DAA
  [11]: https://amzn.to/38b02zx
  [12]: https://www.androidauthority.com/how-to-enter-safe-mode-android-801476/
