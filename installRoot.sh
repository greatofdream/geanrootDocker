if [ -f root_src ]
then
	echo "already git clone"
else
	echo "begin git clone"
	git clone --branch v6-22-00-patches https://github.com/root-project/root.git root_src
fi
mkdir -p root_build && cd root_build
echo "begin cmake"
cmake ../root_src # && check cmake configuration output for warnings or errors
echo "begin make"
cmake --build . -- install -j8
