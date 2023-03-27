-- this was made by my_life101#7445 on discord btw
--no stealing 🥺
--script ver 1.2

local Paused = false
local resume = true
local restart = false
local quit = false

function onCreate()
    if difficulty == 0 then
        makeLuaText('diff','easy / custom', 0, 1000, 150)
    end
    if difficulty  == 1 then
        makeLuaText('diff','normal', 0, 1000, 150)
    end
    if difficulty  == 2 then
        makeLuaText('diff','hard', 0, 1000, 150)
    end
    if botPlay  == true then
        makeLuaText('bptext','botplay', 0, 1000, 180)
    end
	makeLuaSprite('black', 'stageback', -600, -300);
	makeGraphic('black',2560,1400,'000000');
	screenCenter('black');
    addLuaSprite('black',true);
    setProperty('black.alpha',0.5);
    setObjectCamera('black', 'other');
    makeLuaText('bigpause', 'PAUSED', 0, 90, 100);
    setTextSize('bigpause', 100);
    setObjectCamera('bigpause', 'other');
    setTextFont('bigpause', 'pixel_comic.TTF');
    setTextBorder('bigpause', 6, '000000');
    makeLuaText('resume', 'Resume', 0, 90, 210);
    makeLuaText('restart', 'Restart', 0, 90, 240);
    makeLuaText('quit', 'Quit', 0, 90, 270);
    makeLuaText('songname',songName,  0, 1000, 120);
    setTextAlignment('songname', 'right')
    setTextAlignment('diff', 'right')
    setTextSize('resume', 30);
    setTextSize('restart', 30);
    setTextSize('quit', 30);
    setTextSize('songname', 30);
    setTextSize('diff', 30);
    setTextSize('bptext', 30);
    setObjectCamera('resume', 'other');
    setObjectCamera('restart', 'other');
    setObjectCamera('quit', 'other');
    setObjectCamera('songname', 'other');
    setObjectCamera('diff', 'other');
    setObjectCamera('bptext', 'other');
    setTextFont('resume', 'pixel_comic.TTF')
    setTextFont('restart', 'pixel_comic.TTF')
    setTextFont('quit', 'pixel_comic.TTF')
    setTextFont('songname', 'pixel_comic.TTF')
    setTextFont('diff', 'pixel_comic.TTF')
    setTextFont('bptext', 'pixel_comic.TTF')
end

function onUpdatePost()
	if Paused == true then
		setPropertyFromClass('Conductor', 'songPosition', pos) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', pos)
		setProperty('vocals.time', pos)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		setProperty("boyfriend.animation.curAnim.paused", true)
		setProperty("dad.animation.curAnim.paused", true)
		setProperty("gf.animation.curAnim.paused", true)
		setProperty("playerStrums.animation.curAnim.paused", true)
		setProperty("boyfriend.heyTimer", 0)
		setProperty("dad.heyTimer", 0)
		setProperty("gf.heyTimer", 0)
        setProperty('black.visible', true)
        addLuaText('bigpause')
        addLuaText('resume')
        addLuaText('restart')
        addLuaText('quit')
        addLuaText('songname')
        addLuaText('diff')
        addLuaText('bptext')
	else
        doTweenX("stupidout", 'option', -1280, 1, "quadout")
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		setProperty('vocals.volume', 1)
		setProperty('dad.animation.curAnim.paused', false)
		setProperty('gf.animation.curAnim.paused', false)
		setProperty('boyfriend.animation.curAnim.paused', false)
		setProperty("playerStrums.animation.curAnim.paused", false)
        setProperty('black.visible', false)
        removeLuaText('bigpause',false)
        removeLuaText('resume',false)
        removeLuaText('restart',false)
        removeLuaText('quit',false)
        removeLuaText('songname',false)
        removeLuaText('diff',false)
        removeLuaText('bptext',false)
		end
    


        if resume == true then
            setTextColor('resume', 'FFFFFF')
        else
            setTextColor('resume', '999999')
        end
        if restart == true then
            setTextColor('restart', 'FFFFFF')
        else
            setTextColor('restart', '999999')
        end
        if quit == true then
            setTextColor('quit', 'FFFFFF')
        else
            setTextColor('quit', '999999')
        end

        if keyJustPressed ('up') and Paused == true then
            if resume == true then
                quit = true
                resume = false
            elseif restart == true then
                resume = true
                restart = false
            elseif quit == true then
                restart = true
                quit = false
            end
        end
        if keyJustPressed ('down') and Paused == true then
            if resume == true then
                resume = false
                restart = true 
            elseif restart == true then
                restart = false
                quit = true
            elseif quit == true then
                quit = false
                resume = true
            end
        end

    end

function onPause()
    if resume == true then
        characterDance('boyfriend')
        characterDance('dad')
    end
    if restart == true then
        restartSong(false);
    end
    if quit == true then
        exitSong(false);
    end
    Paused = not Paused
    pos = getPropertyFromClass('Conductor', 'songPosition')
    playSound('pause',2)
    characterPlayAnim('boyfriend', 'pause', true)
    characterPlayAnim('dad', 'pause', true)
	return Function_Stop
end