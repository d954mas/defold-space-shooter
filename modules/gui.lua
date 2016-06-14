local M = {}

--read about OOP in lua
function M.getCheckBox(checked,imageOn,imageOff,node)
	local checkBox = {imageOn=imageOn, imageOff=imageOff,checked=true,node=node}
	checkBox.setChecked = 
		function(checked)
			checkBox.checked=checked 
			local animation=checkBox.imageOn
			if(not checked)then animation=checkBox.imageOff end
			gui.play_flipbook(node,animation)
			if(not (checkBox.callback == nil))then
				checkBox.callback(checkBox.checked)
			end
			return checkBox
		end
	checkBox.clicked = 
		function(action)
			if(gui.pick_node(node, action.x, action.y) and action.pressed)then
				checkBox.setChecked(not checkBox.checked)
				return true
			else
				return false
			end
		end
	checkBox.setChecked(checked)	
	return checkBox		
end

function M.get_button(up,down,node)
	local button = {up=up, down=down,over=nil,node=node}
	button.clicked =
		 function(action)
			if(gui.pick_node(node, action.x,action.y)) then
				if(action.released)then
					print("clicked")
					gui.play_flipbook(node,up)
					return true
				elseif(action.pressed or not(action.repeated == nil)) then
					gui.play_flipbook(node,down)
					return false
				end	
			else
				gui.play_flipbook(node,up)
				return false
			end
		end
	return button	
end

return M

