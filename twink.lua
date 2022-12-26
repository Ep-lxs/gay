-- Connection management

local twink = {}
twink.__index = twink

function twink.new()
    return setmetatable({
        _connections = {}
    }, twink)
end

function twink:AddConnection(name, connection: RBXScriptConnection): number
    self._connections[name] = connection
end

function twink:RemoveConnection(name, connectionIndex: number): boolean
    if self._connections[name] then
        self._connections[name]:Disconnect()
        self._connections[name] = nil
        return true
    end
    return false
end

function twink:Reset()
    for _, connection: RBXScriptConnection in ipairs(self._connections) do
        connection:Disconnect()
    end
    table.clear(self._connections)
end

function twink:Destroy()
    self:Reset()
    self._connections = nil
end

return twink
