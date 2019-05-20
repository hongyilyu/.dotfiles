local menubar = hs.menubar.new()
local menuData = {}
local command1 = "system_profiler SPHardwareDataType | grep '  Memory:' | awk '{print $2 $3}'"
local totalMemory = hs.execute(command1):sub(1,-2)
function updateMenubar()
    menubar:setTooltip("Memory Info")
    menubar:setMenu(menuData)
end

function parse(inputstr)
    str1 = string.gmatch(inputstr, '[0-9]+%.[0-9]+')()
    str2 = inputstr:sub(string.len(str1) + 2, -1)
    return str1.."   "..str2
end

function totalUsed()
    local command2 = "ps -caxm -orss= | awk '{ sum += $1 } END { printf \"%.2fGB\", sum/1024/1024}'"
    usedMemory = hs.execute(command2)
    displayStr = 'Mem: '..usedMemory..'/'..totalMemory
    displayStr = hs.styledtext.new(displayStr, {font={size=9.0, color={hex="#000000"}}})
    menubar:setTitle( displayStr )
end

function getMemory()
    local command = "ps axcmo %mem,command | head | sed 1d "
    result = hs.execute(command)
    for s in result:gmatch("[^\r\n]+") do
        table.insert(menuData, { title = parse(s) })
    end
end

getMemory()
updateMenubar()
hs.timer.doEvery(1, getMemory)
hs.timer.doEvery(1, totalUsed)

