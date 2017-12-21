--
-- Author: hongjie
-- Date: 2017-12-15 17:09:52
--

function onIconTap()
	print('aaa')
	terminal:show()	
end

terminal = import('.Terminal').new()
terminalIcon = import('.TerminalIcon').new(onIconTap)
