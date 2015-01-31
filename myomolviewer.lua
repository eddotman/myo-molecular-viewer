scriptId = 'myomolviewer'
scriptTitle = "MyoMolViewer"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market

zoom = false

function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)

    if (pose == "fist" and edge == "on") then
        myo.unlock()
        myo.controlMouse(true)
        myo.mouse("left", "down")
    elseif (pose == "fist" and edge == "off") then
        myo.mouse("left", "up")
        myo.controlMouse(false)
        myo.lock()
    end

    if (pose == "fingersSpread" and edge == "on") then
        if (zoom) then
            myo.unlock()
            myo.controlMouse(true)
            myo.mouse("center", "down")
            myo.debug("Fingers Spread")
        else
            myo.mouse("center", "up")
            myo.controlMouse(false)
            myo.lock()
            myo.debug("Fingers Unspread")
        end
        myo.debug(tostring(zoom))
        zoom = not zoom
    end

    if (pose == "rest" and edge == "on") then
        myo.controlMouse(true)
    elseif (pose == "rest" and edge == "off") then
        myo.controlMouse(false)
    end

    if (pose == " " and edge == "on") then
        myo.Lock()
    end

end

function onPeriodic()
    -- if (myo.mouseControlEnabled()) then
    --     myo.mouse("left", "down")
    -- end
end

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    if (app == "com.valvesoftware.steam") then  --ID for Jmol
        myo.setLockingPolicy("none")
        return true
    else
        return false
    end
end

function activeAppName()
    return "Output Everything"
end

function onActiveChange(isActive)
    myo.debug("onActiveChange")
end
