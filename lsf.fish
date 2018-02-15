function lsf -d "List user defined fish functions"
	set func_path "$HOME/.config/fish/functions"
	for filename in (ls -1 "$func_path")
		set name (echo -n $filename | tr -d '\n' | sed 's/\.[^.]*$//' )
		set topline (head -1 $func_path/$filename)
		echo $topline | grep "\-d \"" > /dev/null
		if test $status -eq 0
			set descr (echo $topline | sed 's/.*"\(.*\)".*/\1/g')
			echo "$name - $descr" | grep -e "^$name"
		else 
			echo $name | grep -e "^$name"
		end
	end
end
