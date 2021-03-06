# Rumbrella
Sample app from [Programming Phoenix](https://pragprog.com/book/phoenix/programming-phoenix) book
## Running locally
  1. cd into Phoenix project directory
  1. `mix deps.get`
  1. `mix deps.compile`
  1. `mix phoenix.server`
  1. go to localhost:4000 in browser
  
 ## Compile issues on Windows
 The comeonin and bcrypt libraries can cause problems when compiling on a windows machine (due to missing C libs or nmake environment path issues)  
 The easiest solution is to use a Visual Studio dev prompt to compile (see [Setting up C on Windows](https://groups.google.com/d/msg/elixir-lang-talk/UYo1CWtqd3c/DsqD4F32FgAJ))
 1. install Visual Studio, start a new C++ project to prompt to install the C++ module (if it's not already installed)
 1. hit the Windows key and search for "Developer Command Prompt for VS2015"
 1. cd into the "VC" directory and run `vcvarsall.bat amd64`
 1. cd over to your project, run `mix deps.get` and `mix deps.compile`
 
 The version 1.0 bcrypt library also can cause problems when trying to generate random bytes and hashes, so downgrade to version 0.12:
 `{:bcrypt_elixir, "~> 0.12"}`