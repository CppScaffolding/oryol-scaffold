-- scaffold geniefile for oryol

oryol_script = path.getabsolute(path.getdirectory(_SCRIPT))
oryol_root = path.join(oryol_script, "oryol")

oryol_includedirs = {
	path.join(oryol_script, "config"),
	oryol_root,
}

oryol_libdirs = {}
oryol_links = {}
oryol_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { oryol_includedirs }
	end,

	_add_defines = function()
		defines { oryol_defines }
	end,

	_add_libdirs = function()
		libdirs { oryol_libdirs }
	end,

	_add_external_links = function()
		links { oryol_links }
	end,

	_add_self_links = function()
		links { "oryol" }
	end,

	_create_projects = function()

project "oryol"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		oryol_includedirs,
	}

	defines {}

	files {
		path.join(oryol_script, "config", "**.h"),
		path.join(oryol_root, "**.h"),
		path.join(oryol_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
