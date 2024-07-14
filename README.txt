Thanks for using my OpenGL C++ template! 
I have no experience making tools for Linux or
Mac, so im afraid this is made for Windows without
consideration for other platforms.

I assume a intermediate level of computer knowledge and programming knowledge from you,
but thats not strictly required.

This template uses Premake, premake is used for generating visual studio solutions
at any time you run it. Ive made GenerateSolution.bat for you to run, and it will
regenerate a new solution with the settings in premake5.lua.
You can find plenty of documentation on how premake works on the internet.
If you want to change the solution name or project name, thats done in
premake5.lua.

Ive automatically linked up GLFW and GLEW to your solution. you can find those in
Dependencies/$(PlatformTarget)

Ive also added a build command so that when your project/solution gets built, 
SolutionResources/CopyResources.bat will be ran, the res folders contents 
will be copied to the output directory, so you dont
have to copy it yourself.
NOTE: for this to work, visual studio has to be run as administrator,
i found this nice forum post that has an answer to how to make visual
studio get ran as administrator every time you run it.
https://superuser.com/questions/1074835/make-visual-studio-solution-filessln-always-executed-as-administrator

I also have added Main.cpp in src with the contents being the basic window 
generation code for glfw and glew.

