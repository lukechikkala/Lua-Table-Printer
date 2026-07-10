
local printtable = require( "LuaTablePrinter" )

local function main()
    local demoTable = {
        [ "Name" ]           = "Hello World"
       ,[ "Version" ]        = "2.1.5"
       ,[ "Author" ]         = "Luke"
       ,[ "Enabled" ]        = true
       ,[ "Alive" ]          = false
       ,[ "Health" ]         = 100
       ,[ "Speed" ]          = 3.14159
       ,[ "Pi" ]             = 3.141592653589793
       ,[ 1 ]                = "First"
       ,[ 2 ]                = "Second"
       ,[ 3 ]                = 4
       ,[ 42 ]               = true
       ,[ true ]             = "Boolean Key"
       ,[ false ]            = 0
    }

    printtable( demoTable )
end


main()

