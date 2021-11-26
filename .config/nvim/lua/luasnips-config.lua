local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

-- I would like this to work but for now I'm using the one from the docs

-- ls.snippet( {trig="trigger"}, {
--   ls.text_node({ "---", "title: " }),
--   ls.insert_node(1, "title"),
--   ls.text_node("return-url: "),
--   ls.insert_node(2, "index.html"),
--   ls.text_node("return-text: "),
--   ls.insert_node(0, "← Return home"),
--   ls.text_node("---")
-- })

s("trigger", t("Wow! Text!"))

