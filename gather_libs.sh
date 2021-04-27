running_dir=`pwd`
mkdir -p gathered_libs
cd gathered_libs
mkdir -p "include"
mkdir -p "lib"
cd "include"
include_dir=`pwd`
cd ..
cd "lib"
lib_dir=`pwd`
cd ..
cd ..

echo "Results will be stored in:"
echo "$include_dir"
echo "$lib_dir"

cd install

platform_dir=(*)

cd "${platform_dir[0]}"

gather_lib() {
    files=(*)
    cp "./${files[0]}" "$lib_dir"
}

gather_include() {
    if [ "$1" == "soem" ] 
    then
        header_dir=(*)
        cp -r ${header_dir[0]} $include_dir
    else
        header_superdir=(*)
        cd "${header_superdir[0]}"
        header_dir=(*)
        cp -r ${header_dir[0]} $include_dir
        cd ..
    fi
}

gather() {
    cd $1
    version_dir=(*)
    cd "${version_dir[0]}"
    cd "lib"
    gather_lib $1
    cd ..
    cd "include"
    gather_include $1
    cd ..
    cd ..
    cd ..
}

for libdir in *; do
    if [ "$libdir" != "__system__" ]
    then
        echo "$libdir"
        gather $libdir
    fi
done
