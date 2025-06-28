-- premake5.lua
workspace "vulkan-client"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "WalnutApp"

   -- Workspace-wide build options for MSVC
   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

-- Directories
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
WalnutNetworkingBinDir = "Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/%{cfg.system}/%{cfg.buildcfg}/"

include "Walnut/Build-Walnut-External.lua"

group "App"
    include "vulkan-common/Build-vulkan-Common.lua"
    include "vulkan-client/Build-vulkan-Client.lua"
group ""