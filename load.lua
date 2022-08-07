local a = game:GetService("Players")
local b = game:GetService("ReplicatedStorage")
local c = nil
pcall(
    function()
        c = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenScreeenMan134/Tags/main/list.lua"))()
    end
)
local d
local e
local f = {}
if c ~= nil then
    local j = function(k)
        k = tostring(k)
        k = string.gsub(string.gsub(k, ".",function(l) return string.byte(l) end),".",function(m) return string.byte(m) end) return "_" .. string.reverse(k) end
    print(k)
    local getconnections = getconnections or get_signal_cons
    if getconnections then
        for m, l in pairs(getconnections(b.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
            if
                l.Function and #debug.getupvalues(l.Function) > 0 and type(debug.getupvalues(l.Function)[1]) == "table" and
                    getmetatable(debug.getupvalues(l.Function)[1]) and
                    getmetatable(debug.getupvalues(l.Function)[1]).GetChannel
             then
                d = getmetatable(debug.getupvalues(l.Function)[1])
                e = getmetatable(debug.getupvalues(l.Function)[1]).GetChannel
                getmetatable(debug.getupvalues(l.Function)[1]).GetChannel = function(n, o)
                    local p = e(n, o)
                    if p and p.AddMessageToChannel then
                        local q = p.AddMessageToChannel
                        if f[p] == nil then
                            f[p] = p.AddMessageToChannel
                        end
                        p.AddMessageToChannel = function(r, s)
                            if s.FromSpeaker and a:FindFirstChild(tostring(s.FromSpeaker)) then
                                local t = a:FindFirstChild(tostring(s.FromSpeaker))
                                for m, l in pairs(c) do
                                    if true then
                                        s.ExtraData = {
                                            NameColor = t.Team == nil and Color3.new(0, 1, 1) or t.TeamColor.Color,
                                            Tags = {
                                                table.unpack(s.ExtraData.Tags/),
                                                {
                                                    TagColor = Color3.fromHex("#" .. l[2][2]),
                                                    TagText = string.upper(l[2][1])
                                                }
                                            }
                                        }
                                    end
                                end
                            end
                            return q(r, s)
                        end
                    end
                    return p
                end
            end
        end
    end
end
