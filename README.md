# Lua Table Printer

Prints a table in a neat format.<br>
It takes care that the table is sorted based on keys.

# Usage
Place the `LuaTablePrinter.lua` file either in the same directory as your script or in on of your `LUA_PATH` paths.<br>
The `example.lua` shows how it can be used.

# Output
```
+----+---------+----------+-----------------+------------+
| No |   Key   | Key Type |      Value      | Value Type |
+----+---------+----------+-----------------+------------+
|  1 | 1       | number   |           First | string     |
|  2 | 2       | number   |          Second | string     |
|  3 | 3       | number   |               4 | number     |
|  4 | 42      | number   |            true | boolean    |
|  5 | Alive   | string   |           false | boolean    |
|  6 | Author  | string   |            Luke | string     |
|  7 | Enabled | string   |            true | boolean    |
|  8 | Health  | string   |             100 | number     |
|  9 | Name    | string   |     Hello World | string     |
| 10 | Pi      | string   | 3.1415926535898 | number     |
| 11 | Speed   | string   |         3.14159 | number     |
| 12 | Version | string   |           2.1.5 | string     |
| 13 | false   | string   |             nil | nil        |
| 14 | true    | string   |             nil | nil        |
+----+---------+----------+-----------------+------------+
```

