## Make
Make is a build automation tool that automatically builds executable programs and libraries from source code by reading files called Makefiles, which specify how to derive the target program. 
## Features supported
By using this Makefile template one can create `main.cpp` as an entiry point, `src` directory for source files and `include` directory for header files

## Setup
To start on your project:
1. First make sure that you are in a ⚠️ empty directory ⚠️ otherwise running `make setup` will cause the deletion of all files in the current direcotry.
2. Clone the repo.
3. Run `make setup` which removes both the connection to this repo and the README.md file, then it creates `main.cpp` file + `src`, `include` and `build` directories which are the defualt directory struture for this build system.
