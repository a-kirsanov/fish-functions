function mkhello -d "Create c++ hello project template in a ~/projects/test directory "
	if test (count $argv) -ne 1
		echo Wrong argument count
		return
	end
	set full_name $argv[1]
	set name (echo $full_name | sed 's/.*\/\(.*\)/\1/g')
	set project_path ~/projects/test
	cd $project_path

	if test -d $full_name
		echo Project $full_name already exists in $project_path
		cd -
		return
	end
	mkdir -p $full_name
	set main_source "#include <iostream>

using namespace std;

int main() {
	cout << \"Hello, world\" << endl;
}
"

	set makefile_source "
all:
	g++ main.cpp --std=c++11 -o $name
"

	echo $main_source > main.cpp
	echo $makefile_source > Makefile

	vim main.cpp
end
