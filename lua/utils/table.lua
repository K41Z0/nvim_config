local TableLib = {}

--- Adds unique items to a table
-- @param list table The list to insert into
-- @param items table|string|number The item(s) to insert; can be a single value or a list of values
function TableLib.insert(list, items)
  if type(list) ~= "table" then
    return
  end

  -- Convert @param(items) to table if not already
  if type(items) ~= "table" then
    items = { items }
  end

  -- Use a lookup table for O(1) check
  local seen = {}
  for i = #list, 1, -1 do
    seen[list[i]] = true
  end

  for _, item in ipairs(items) do
    if not seen[item] then
      table.insert(list, item)
      seen[item] = true
    end
  end
end

return TableLib
