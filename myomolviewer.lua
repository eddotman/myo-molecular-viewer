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
    myo.mouse("left", "down")
    myo.controlMouse(true)
    return (app == "net.java.openjdk.cmd")  --ID for Jmol
end

function activeAppName()
    return "Output Everything"
end

function onActiveChange(isActive)
    myo.debug("onActiveChange")
end
