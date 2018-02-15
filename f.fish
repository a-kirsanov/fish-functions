function f -d "Find files in current directory by *patern*"
	find ./ -name "*$argv*"
end
