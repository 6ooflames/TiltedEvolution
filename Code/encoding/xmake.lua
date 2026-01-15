local function build_encoding(name, game)
target(name)
    set_kind("static")
    set_group("common")
    add_includedirs(".", "../", {public = true})
    add_headerfiles("**.h|Structs/Skyrim/**|Structs/Fallout4/**", {prefixdir = "Encoding"})
    add_files("**.cpp|Structs/Skyrim/**|Structs/Fallout4/**")
    set_pcxxheader("EncodingPch.h")

    if is_plat("linux") then
        add_cxxflags("-fPIC")
    end    

    add_files("Structs/" .. game .. "/**.cpp")
    add_headerfiles("Structs/" .. game .. "/**.h")
    add_includedirs("Structs/" .. game)

    add_packages("hopscotch-map", "glm", "tiltedcore")
end

build_encoding("SkyrimEncoding", "Skyrim")
build_encoding("Fallout4Encoding", "Fallout4")
