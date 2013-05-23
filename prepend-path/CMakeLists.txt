FIND_PACKAGE(Torch REQUIRED)
SET(src )

SET(luasrc
   init.lua
)

ADD_TORCH_PACKAGE(prepend-path "${src}" "${luasrc}" "Prepend environment variable to torch search path")
