-- CLI Process List for Ozone
-- Written by Gonow32

if not System or not Registry then
	print("This program requires Ozone.")
	return
end

local taskList = System.GetProcessList()

for i, v in pairs(taskList) do
	print("ID "..tostring(i).." - "..v.sName)
end