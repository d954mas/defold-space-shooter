local M = {}

function M.getCheckBox(checked,imageOn,imageOff,node)
	local checkBox = {imageOn=imageOn, imageOff=imageOff,checked=true,node=node}
	checkBox.setChecked = 
		function(checked)
			checkBox.checked=checked 
			local animation=checkBox.imageOn
			if(not checked)then animation=checkBox.imageOff end
			print(animation)
			gui.play_flipbook(node,animation)
			return checkBox
		end
	checkBox.setChecked(checked)	
	return checkBox		
end

return M

