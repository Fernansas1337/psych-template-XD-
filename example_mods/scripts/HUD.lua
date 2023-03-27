function onCreate()
  --makeLuaSprites
  makeLuaSprite('black1', 'black1', 297.5, 20)
  makeLuaSprite('gray', 'gray', 303, 25.25)
  makeLuaSprite('red', 'red', 303, 25.25)

  --scaleObjects
  scaleObject('black1', 2, .065)
  scaleObject('gray', 1.965, .035)
  scaleObject('red', 1.965, .035)
  --scaleObject('healthBar', 0.99, 0.99);

   --lol
  setObjectCamera('black1', 'hud')
  setObjectCamera('gray', 'hud')
  setObjectCamera('red', 'hud')

  --addLuaSprites
  addLuaSprite('black1', true)
  addLuaSprite('gray', true)
  addLuaSprite('red', true)
  
  --makeLuaTexts
  makeLuaText('Watermark', 'IKVI X SION BEST SHIP', 0, 4, getProperty('healthBarBG.y') + 58);
  
  --addLuaTexts
  addLuaText('Watermark')
  addLuaText("nametext")

end

function onCreatePost()
   --bruh
   makeLuaText("nametext", songName, 0, 600, 19.5)
  setTextAlignment('nametext', 'left')
   
  --addLuaTexts2
  addLuaText("nametext")

   --setObjectOrders
   setObjectOrder('healthBar', 3)
   setObjectOrder('healthBarBG', 2)

   --setPropertys
   setProperty('timeBarBG.visible', false)
   setProperty('laneunderlayOpponent.visible', false)
   setProperty('laneunderlay.visible', false)
   setProperty('timeBar.visible', false)
   setProperty('timeTxt.visible', false)
   setProperty('scoreTxt.visible', true)
   setProperty('versionTxt.visible', true)
      
   --setObjectCameras
   --setObjectCamera('healthBarBG', 'other');
   --setObjectCamera('healthBar', 'hud');

   --Text fonts
   setTextFont('scoreTxt', 'text')
   setTextFont('healthCounter', 'rubik.ttf')
   setTextFont('timeTxt', 'rubik.ttf')
   setTextFont('botplayTxt', 'rubik.ttf')
   setTextFont('judgementCounter', 'rubik.ttf')
   setTextFont('Watermark', 'rubik.ttf');
   
   --Text sizes
   setTextSize('scoreTxt', 17);
   setTextSize('Watermark', 16);
   setTextSize('nametext', 18)

   --moreTextStuff
   setTextBorder('Watermark', 1.75, '000000');
   setTextAlignment('Watermark', 'center');
end

--other stuff
function onUpdate()
    scaleObject('red', 1.965 * getProperty("songPercent"), .035)

    if downscroll then -- downscroll only
        setProperty('black1.y', 685)
        setProperty('gray.y', 690)
        setProperty('red.y', 690)
        setProperty('nametext.y', 685)
        setProperty('Watermark.y', -185)
    end
end