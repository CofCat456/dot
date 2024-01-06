local present, ls = pcall(require, "luasnip")
if not present then
	return
end

local fmt = require("luasnip.extras.fmt").fmt
local snippet = ls.snippet
local insert_node = ls.insert_node

---@return string[]

ls.add_snippets("vue", {
	snippet(
		"setup",
		fmt(
			[[
<script lang="ts" setup>
const props = defineProps<{{
  modelValue?: boolean,
}}>()
</script>

<template>
  {}
</template>
]],
			{
				insert_node(1, ""),
			}
		)
	),
})
