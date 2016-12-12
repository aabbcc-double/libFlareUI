# libFlareUI
Crossplatform GUI library built on top SDL2 in Objective-C using Mulle-Objc
------------

![Screenshot](http://i.imgur.com/NSLTvlX.gif)

_Running demo_

## Installing
### Requirements
* [mulle-objc](http://i.imgur.com/NSLTvlX.gif)
* [libSDL2](https://www.libsdl.org/)
* [cmake](https://cmake.org/)

```
[WARNING]
Currently tested only on OSX
```



### Building demo app
* Clone the project
```
git clone https://github.com/aabbcc-double/libFlareUI
cd libFlareUI
```
* Make directory named `build` and move enter
```
mkdir build
cd build
```
* Run cmake
```
CC=mulle-clang CXX=mulle-clang cmake ..
```
* Run make 
```
make
```
* Run demo application
```
./flare-ui-example
```