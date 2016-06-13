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
		function(x,y)
			if(gui.pick_node(node, x, y))then
				checkBox.setChecked(not checkBox.checked)
				return true
			else
				return false
			end
		end
	checkBox.setChecked(checked)	
	return checkBox		
end

return M

