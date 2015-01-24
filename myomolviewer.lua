scriptId = 'myomolviewer'
scriptTitle = "MyoMolViewer"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market

function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)

    if (pose == "fist" and edge == "on") then
        myo.mouse("left", "down")
    else
        myo.mouse("left", "up")
    end
end

function onPeriodic()
    -- if (myo.mouseControlEnabled()) then
    --     myo.mouse("left", "down")
    -- end
end

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    if (not myo.mouseControlEnabled()) then
        myo.controlMouse(true)
    end
    if (app == "net.java.openjdk.cmd") then  --ID for Jmol
        return true
    else
        myo.controlMouse(false)
        myo.mouse("left", "up")
        return false
    end
end

function activeAppName()
    return "Output Everything"
end

function onActiveChange(isActive)
    myo.debug("onActiveChange")
end
