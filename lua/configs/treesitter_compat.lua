local M = {}

local aliases = {
  ex = "elixir",
  pl = "perl",
  sh = "bash",
  uxn = "uxntal",
  ts = "typescript",
}

local html_script_type_languages = {
  ["importmap"] = "json",
  ["module"] = "javascript",
  ["application/ecmascript"] = "javascript",
  ["text/ecmascript"] = "javascript",
}

local function directive_opts()
  return vim.fn.has "nvim-0.10" == 1 and { force = true, all = false } or true
end

local function first_node(node)
  if type(node) == "table" then
    return node[1]
  end

  return node
end

local function capture_metadata(metadata, id)
  local value = metadata and metadata[id]
  if type(value) == "table" and vim.islist(value) then
    return value[1]
  end

  return value
end

local function node_text(match, bufnr, id, metadata)
  local node = first_node(match[id])
  if not node then
    return nil
  end

  return vim.treesitter.get_node_text(node, bufnr, { metadata = capture_metadata(metadata, id) })
end

local function parser_from_markdown_info_string(injection_alias)
  local match = vim.filetype.match { filename = "a." .. injection_alias }
  return match or aliases[injection_alias] or injection_alias
end

function M.patch_directives()
  local query = require "vim.treesitter.query"
  local opts = directive_opts()

  query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
    local type_attr_value = node_text(match, bufnr, pred[2], metadata)
    if not type_attr_value then
      return
    end

    local parts = vim.split(type_attr_value, "/", {})
    metadata["injection.language"] = html_script_type_languages[type_attr_value] or parts[#parts]
  end, opts)

  query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
    local injection_alias = node_text(match, bufnr, pred[2], metadata)
    if not injection_alias then
      return
    end

    metadata["injection.language"] = parser_from_markdown_info_string(injection_alias:lower())
  end, opts)

  query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
    local id = pred[2]
    local text = node_text(match, bufnr, id, metadata) or ""

    if not metadata[id] then
      metadata[id] = {}
    end

    metadata[id].text = string.lower(text)
  end, opts)
end

return M
