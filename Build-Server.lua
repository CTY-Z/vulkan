-- premake5.lua
workspace "vulkan-server"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "App-Server"

   -- Workspace-wide defines
   defines
   {
       "WL_HEADLESS"
   }

   -- Workspace-wide build options for MSVC
   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

-- Directories
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
WalnutNetworkingBinDir = "Walnut/Walnut-Modules/Walnut-Networking/vendor/GameNetworkingSockets/bin/%{cfg.system}/%{cfg.buildcfg}/"

include "Walnut/Build-Walnut-Headless-External.lua"

group "App"
    include "vulkan-common/Build-vulkan-Common-Headless.lua"
    include "vulkan-server/Build-vulkan-Server-Headless.lua"
group ""