# Phoenix Sandbox
 - sandbox for learning Phoenix
 - code snippets and exercises from [Programming Phoenix](https://pragprog.com/book/phoenix/programming-phoenix) by Chris McCord, Bruce Tate, and José Valim
 
 # Running locally
  1. cd into Phoenix project directory
  1. `mix deps.get`
  1. `mix deps.compile`
  1. `mix phoenix.server`
  1. go to localhost:4000 in browser
  
 ## Compile issues on Windows
 The comeonin and bcrypt libraries can cause problems when compiling on a windows machine (due to missing c libs, or environment path issues with nmake)  
 The easiest solution is to use a Visual Studio dev prompt to compile (see [Setting up C on Windows](https://groups.google.com/forum/?hl=en#!topic/elixir-lang-talk/UYo1CWtqd3c))
 1. install Visual Studio, start a new C++ project to prompt to install the C++ module (if it's not already installed)
 1. hit the Windows key and search for "Developer Command Prompt for VS2015"
 1. cd into the "VC" directory and run `vcvarsall.bat amd64`
 1. cd over to your project, run `mix deps.get` and `mix deps.compile`
