# Driver compilation

The following guide enables anyone to compile the drivers on its own machine, a new Jetson or simply recompile.

By "drivers" we mean the dynamic library files and the header files for `ethercatcpp-epos`, `ethercatcpp-core`, `pid-signal_manager`, `xcontrol` and `soem`. 

# Steps

* Clone the PID repo

`git clone https://github.com/lirmm/pid-workspace`

* Configure the workspace 

```bash
cd pid-workspace
./pid configure
```

* Goto packages and clone the `xcontrol` repo

```bash
cd packages
git clone https://github.com/EPFLXplore/Xcontrol xcontrol
```

* Build

```bash
cd xcontrol/build
cmake .. -DBLUID_EXAMPLES=ON
make build
```

* Retrieve the lib/include files

Trust me, the process is long and boring. Fortunately, bash scripts exist.
 
First clone this repo outside of `pid-workspace`.

```bash
git clone https://github.com/EPFLXplore/DriverCompilation
```
Then copy the script `gather_libs.sh` to `pid-workspace` and execute it:
```bash
sudo chmod 755 gather_libs.sh
./gather_libs
```

The result is stored in `gathered_libs` in the same folder.

* The last step is to copy those files into the ROS project directory



