workspace "myWorkspace"
	startproject "myApp"
	platforms {"x86", "x64"}

	configurations {
		"Debug",
		"Release"
	}

	filter { "platforms:x86" }
		architecture "x86"

	filter { "platforms:x64" }
		architecture "x64"

outputdir = "%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}"

project "myApp"
	location "myApp"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"

	defines {
		"GLEW_STATIC"
	}

	links {
		"opengl32.lib",
		"glew32s.lib",
		"glfw3.lib"
	}

	targetdir("bin/" .. outputdir)
	objdir("bin-int/" .. outputdir)

	files {
		"%{prj.location}/src/**.h",
        "%{prj.location}/src/**.cpp"
	}

	includedirs {
		"$(ProjectDir)src",
		"$(SolutionDir)Dependencies/$(PlatformTarget)/",
		"$(SolutionDir)Dependencies/headerLibs/"
	}

	libdirs {
		"$(SolutionDir)Dependencies/$(PlatformTarget)/glfw",
		"$(SolutionDir)Dependencies/$(PlatformTarget)/glew"
	}

	postbuildcommands {
		"\"$(SolutionDir)SolutionResources/CopyResources.bat\" " .. outputdir
	}

	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
	optimize "On"