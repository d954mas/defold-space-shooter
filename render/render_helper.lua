
local M = {}

M.scale_height=1
M.scale_width=1
M.viewport_x=0
M.viewport_y=0
M.world_width=1
M.world_height=1
M.camera_x=0

function M.action_to_position(action)
	position = vmath.vector3((action.screen_x-M.viewport_x)*M.scale_width, (action.screen_y-M.viewport_y) * M.scale_height, 0)
	position.x=M.clamp(position.x,0,720)
	position.y=M.clamp(position.y,0,960)
	return position
end

function M.action_to_camera_position(action)
	position = vmath.vector3(M.camera_x+(action.screen_x-M.viewport_x)*M.scale_width, (action.screen_y-M.viewport_y) * M.scale_height, 0)
	position.x=M.clamp(position.x,0,720)
	position.y=M.clamp(position.y,0,960)
	return position
end

function M.updateWorld(world_width,world_height,viewport_x,viewport_y,viewport_width,viewport_height,camera_x)
	M.viewport_x=viewport_x
	M.viewport_y=viewport_y
	M.camera_x=camera_x
	M.world_height=world_height
	M.world_width=world_width
	M.scale_width=world_width/viewport_width
	M.scale_height=world_height/viewport_height
end

function M.clamp(number,low,high)
	if(number<low) then return low end
	if(number>high) then return high end
	return number
end	

return M
