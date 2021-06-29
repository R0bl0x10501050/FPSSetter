local RunService = game:GetService("RunService")

wait()

local MaxFPS = script:GetAttribute('MaxFPS') or 60

while true do
	local t = tick()
	RunService.RenderStepped:Wait()
	repeat until (t + 1/MaxFPS) < tick()
end
