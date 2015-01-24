scriptId = 'myomolviewer'
scriptTitle = "MyoMolViewer"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market

function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)
end

function onPeriodic()
end

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    myo.controlMouse(true)
    myo.mouse("left", "down")
    return (app == "net.java.openjdk.cmd")
end

function activeAppName()
    return "Output Everything"
end

function onActiveChange(isActive)
    myo.debug("onActiveChange")
end
