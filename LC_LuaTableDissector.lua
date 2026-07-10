
local function PrintBorders( spacersize, max_tab_size, max_key_size, max_key_type_size, max_val_size, max_val_type_size )
    local borders   =    "+"
                    -- No
                    .. string.rep( "-", spacersize + max_tab_size      + spacersize )
                    .. "+"

                    -- Key
                    .. string.rep( "-", spacersize + max_key_size      + spacersize )
                    .. "+"

                    -- Key Type
                    .. string.rep( "-", spacersize + max_key_type_size + spacersize )
                    .. "+"

                    -- Value
                    .. string.rep( "-", spacersize + max_val_size      + spacersize )
                    .. "+"

                    -- Value Type
                    .. string.rep( "-", spacersize + max_val_type_size + spacersize )

                    .. "+"

    print( borders )
end

local function GetTableInfo( myTable )
    --[ Finding Max Table Size ]----------------------
    local spacersize    = 1
    local max_tab_size  = 2
    local count         = 0

    for _ in pairs( myTable ) do
         count = count + 1
    end
    if #tostring( count ) > max_tab_size then max_tab_size = #tostring( count ) end

    --[ Finding Max Key Size ]-------------------------------------------------
    local max_key_size  = 2
    for k, v in pairs( myTable ) do
       if #tostring( k ) > max_key_size then
           max_key_size = #tostring( k )
       end
    end

    --[ Finding Max Key Type Size ]-------------------
    local max_key_type_size  = 8
    for k, v in pairs( myTable ) do
       if #type( k ) > max_key_type_size then
           max_key_type_size = #type( k )
       end
    end

    --[ Finding Max Value Size ]-----------------------------------------------
    local max_val_size  = 2
    for k, v in pairs( myTable ) do
       if #tostring( v ) > max_val_size then
           max_val_size = #tostring( v )
       end
    end

    --[ Finding Max Value Type Size ]-----------------
    local max_val_type_size  = 10
    for k, v in pairs( myTable ) do
       if #type( v ) > max_val_type_size then
           max_val_type_size = #type( v )
       end
    end

    return spacersize, max_tab_size, max_key_size, max_key_type_size, max_val_size, max_val_type_size
end

local function DataPrinter( word, max_len )
    local spacer            = " "
    local word_len          = #word
    local spacer_left       = string.rep( " ", math.floor( ( max_len - word_len ) / 2 ) )
    local spacer_right      = string.rep( " ", math.ceil ( ( max_len - word_len ) / 2 ) )

    local result    = spacer
        .. spacer_left
        .. word
        .. spacer_right
        .. spacer

    return result
end

local function PrintHeaders( spacersize, max_tab_size, max_key_size, max_key_type_size, max_val_size, max_val_type_size )
   local header_No   = "No"
   local header_K    = "Key"
   local header_KT   = "Key Type"
   local header_V    = "Value"
   local header_VT   = "Value Type"

   header_No = DataPrinter( header_No, max_tab_size         )
   header_K  = DataPrinter( header_K , max_key_size         )
   header_KT = DataPrinter( header_KT, max_key_type_size    )
   header_V  = DataPrinter( header_V , max_val_size         )
   header_VT = DataPrinter( header_VT, max_val_type_size    )

   local headers = "|"
   .. header_No
   .. "|"
   .. header_K
   .. "|"
   .. header_KT
   .. "|"
   .. header_V
   .. "|"
   .. header_VT
   .. "|"

   print( headers )
end

local function PrintTValues( spacersize, max_tab_size, max_key_size, max_key_type_size, max_val_size, max_val_type_size, myTable )
    local spacer        = " "
    local myKeys        = {}
    local myKeyTypes    = {}
    local count         = 1

    -- Extracting only Keys
    for k, v in pairs( myTable ) do
        myKeys[ count ] = k
        count           = count + 1
    end

    table.sort( myKeys, function( a, b ) return tostring( a ) < tostring( b ) end )
    local No    = 1

    for _, SortedKey in pairs( myKeys ) do
        if type( SortedKey ) == "boolean" then
            SortedKey = tostring( SortedKey )
        end

        print(
            "|"

            -- No
            .. spacer
            .. string.rep( " ", max_tab_size - #tostring( No ) )
            .. No
            .. spacer
            .. "|"

            -- Key
            .. spacer
            .. SortedKey
            .. string.rep( " ", max_key_size - #tostring( SortedKey ) )
            .. spacer
            .. "|"

            -- Key Type
            -- NOTE: This is currently printing the type of value and not of key
            .. spacer
            .. type( SortedKey )
            .. string.rep( " ", max_key_type_size - #tostring( type( SortedKey ) ) )
            .. spacer
            .. "|"

            -- Value
            .. spacer
            .. string.rep( " ", max_val_size - #tostring( myTable[ SortedKey ] ) )
            .. tostring( myTable[ SortedKey ] )
            .. spacer
            .. "|"

            -- Value Type
            .. spacer
            .. type( myTable[ SortedKey ] )
            .. string.rep( " ", max_val_type_size - #tostring( type( myTable[ SortedKey ] ) ) )
            .. spacer
            .. "|"

        )
        No = No + 1
    end
end

local function TableDissector( myTable )
    local ss, size_t, size_k, size_k_t, size_v, size_v_t = GetTableInfo( myTable )
    PrintBorders( ss, size_t, size_k, size_k_t, size_v, size_v_t )
    PrintHeaders( ss, size_t, size_k, size_k_t, size_v, size_v_t )
    PrintBorders( ss, size_t, size_k, size_k_t, size_v, size_v_t )
    PrintTValues( ss, size_t, size_k, size_k_t, size_v, size_v_t, myTable )
    PrintBorders( ss, size_t, size_k, size_k_t, size_v, size_v_t )
end

local function main()
    local myTable = {
        [ "Name" ]           = "Hello World"
       ,[ "Version" ]        = "2.1.5"
       ,[ "Author" ]         = "Luke"
       ,[ "Enabled" ]        = true
       ,[ "Alive" ]          = false
       ,[ "Health" ]         = 100
       ,[ "Speed" ]          = 3.14159
       ,[ "Pi" ]             = 3.141592653589793
       ,[ "Nothing" ]        = nil
       ,[ 1 ]                = "First"
       ,[ 2 ]                = "Second"
       ,[ 3 ]                = 4
       ,[ 42 ]               = true
       ,[ true ]             = "Boolean Key"
       ,[ false ]            = 0
    }

    TableDissector( myTable )
end

main()

