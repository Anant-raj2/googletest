project "googletest"
  kind "StaticLib"
  files {"googletest/include/**", "googletest/src/**"}
  language "C++"
  staticruntime "on"
  architecture "x86_64"

  targetdir "%{wks.location}/bin/" .. outputdir .. "/%{prj.name}"
  targetdir "%{wks.location}/objs/" .. outputdir .. "/%{prj.name}"

	files {
		"src/**.h",
		"src/**.cc",
		"include/**.h"
	}

	includedirs {
		".",
		"include/",
	}
	filter{}
	filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"

	filter{}
	filter "configurations:Release"
		defines "NDEBUG"
		runtime "Release"
		optimize "on"

	filter{}
	filter "system:Linux"
		pic "On"
		buildoptions {
			"-Wall", "-Wshadow", "-Wno-error=dangling-else",
			"-fno-exceptions", "-fno-rtti", "-DGTEST_HAS_RTTI=0"
		}
		defines {
			"GTEST_OS_LINUX"
		}
