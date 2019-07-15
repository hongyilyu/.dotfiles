local command1 = "/Applications/smcFanControl.app/Contents/Resources/smc -k TC0P -r | awk -F ' ' '{print $3}'"

function setFanSpeed(fanSpeed)
    command2 = "/Applications/smcFanControl.app/Contents/Resources/smc -k F0Mn -w "..fanSpeed
    command3 = "/Applications/smcFanControl.app/Contents/Resources/smc -k F1Mn -w "..fanSpeed
    hs.execute(command2)
    hs.execute(command3)
end


function checkTemperature()
    local currentTemp = hs.execute(command1):sub(1,-2)
    currentTemp = tonumber(currentTemp)

    if currentTemp > 55 then
        setFanSpeed(5500)
        print("Temperate over 55 degree, set fan speed to 5500")
    elseif currentTemp > 40 then
        setFanSpeed(4500)
        print("Temperate over 40 degree, set fan speed to 4500")
    elseif currentTemp > 30 then
        setFanSpeed(3500)
        print("Temperate over 30 degree, set fan speed to 3500")
    else
        setFanSpeed(2500)
        print("Temperate below 30 degree, set fan speed to 2500")
    end
end

checkTemperature()
hs.timer.doEvery(60*5, checkTemperature)

