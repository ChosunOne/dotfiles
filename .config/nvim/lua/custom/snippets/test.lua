local ls = require 'luasnip'

---@class Opts
---@field type "snippets" | "autosnippets" | nil This serves as default values for the snippetType key of each snippet added by this call
---@field key string The unique key for this group of snippets. Only the latest call with this key is used.

--- Add a snippet
--- See :help luasnip-api for how to add snippets
---@param ft string|nil The file type to apply this snippet
---@param snippets table|List The list of snippets to add
---@param opts Opts|nil The options to apply to all the snippets in this call
local add_snippets = function(ft, snippets, opts)
  ls.add_snippets(ft, snippets, opts)
end

-- ls.parser.parse_snippet(<text>, <VS **** style snippet>)
add_snippets('all', {
  ls.parser.parse_snippet('expand', '-- this is what was expanded!'),
}, { key = 'example all' })

add_snippets('lua', {
  -- Place indices start at 1, and 0 is used to indicate it is the last position to go to.
  -- This is so you don't need to reorder the last item if you change the number of items before it.
  -- $1 and so on are simply labels for where your cursor should go.
  -- There are also some special symbols like `$TM_FILENAME` that can fill in information based on the current file.
  ls.parser.parse_snippet('lf', 'local $1 = function($2)\n $0\nend'),
}, { key = 'example lua' })

-- While it's nice to make snippets with simple labels, the real power of luasnip comes from building snippets with lua code.
-- s indicates a new snippet
-- s(<trigger>, <nodes>), where <trigger> is what we will use to expand the snippet
-- local s = ls.s

return {}
