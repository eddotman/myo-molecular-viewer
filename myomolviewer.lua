scriptId = 'myomolviewer'
scriptTitle = "MyoMolViewer"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market

function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)

    if (myo.isUnlocked()) then
        if (pose == "fist" and edge == "on") then
            myo.controlMouse(true)
            myo.mouse("left", "down")
        end

        if (pose == "fingersSpread" and edge == "on") then
            myo.controlMouse(true)
            myo.mouse("center", "down")
        end
    end
end

function onPeriodic()
    -- if (myo.mouseControlEnabled()) then
    --     myo.mouse("left", "down")
    -- end
end

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    if (app == "net.java.openjdk.cmd") then  --ID for Jmol
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
