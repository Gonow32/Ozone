-- Kill Process Tool for Ozone
-- Written by Gonow32

local tArgs = {...}

if not System or not Registry then
	print("This program requires Ozone.")
	return
end

local ContainsHelpSwitch = false
local ContainsData = false
for i, v in pairs(tArgs) do
	ContainsData = true
	if v == "-?" or v == "-h" or v == "--help" then
		ContainsHelpSwitch = true
	end
end

if ContainsHelpSwitch or not ContainsData then
	print("Usage: kill <id>")
	return
end

local killIDs = {}

for i, v in pairs(tArgs) do
	if tonumber(v) then
		table.insert(killIDs, tonumber(v))
	end
end

local currentTaskList = System.GetProcessList()

for i, v in pairs(killIDs) do
	if currentTaskList[v] then
		local ok, result = pcall(System.KillProcess, v)
		if not ok then
			print("Failed to kill process with ID "..tostring(v))
		else
			print("Successfully killed process with ID "..tostring(v))
		end
	else
		print("Process with ID "..tostring(v).." does not exist.")
	end
end