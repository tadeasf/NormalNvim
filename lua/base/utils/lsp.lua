--- ### LSP utils.

--  DESCRIPTION:
--  Functions we use to configure the plugin `mason-lspconfig.nvim`.
--  You can specify your own lsp settings inside `M.apply_user_lsp_settings()`.
--
--  Since Neovim 0.11 we don't use the `require("lspconfig")` framework anymore.
--  Instead, we register our settings with the nvim native lsp API:
--  `vim.lsp.config()`, and `mason-lspconfig` enables the servers you install.
--
--  Most options we use in `M.apply_default_lsp_settings()`
--  can be tweaked on the file `../1-options.lua`.
--  Take this into consideration to minimize the risk of breaking stuff.

--    Functions:
--      -> M.apply_default_lsp_settings  → Apply our default lsp settings.
--      -> M.apply_user_lsp_mappings     → Apply the user lsp keymappings.
--      -> M.apply_user_lsp_settings     → Apply the user lsp settings.
--      -> M.setup                       → Register the settings on nvim lsp.

local M = {}
local utils = require "base.utils"

--- Apply default settings for diagnostics, formatting, and lsp capabilities.
--- It only need to be executed once, normally on mason-lspconfig.
--- @return nil
M.apply_default_lsp_settings = function()
  -- Icons
  -- Apply the icons defined in ../icons/icons.lua
  local get_icon = utils.get_icon
  local signs = {
    { name = "DiagnosticSignError",    text = get_icon("DiagnosticError"),        texthl = "DiagnosticSignError" },
    { name = "DiagnosticSignWarn",     text = get_icon("DiagnosticWarn"),         texthl = "DiagnosticSignWarn" },
    { name = "DiagnosticSignHint",     text = get_icon("DiagnosticHint"),         texthl = "DiagnosticSignHint" },
    { name = "DiagnosticSignInfo",     text = get_icon("DiagnosticInfo"),         texthl = "DiagnosticSignInfo" },
    { name = "DapStopped",             text = get_icon("DapStopped"),             texthl = "DiagnosticWarn" },
    { name = "DapBreakpoint",          text = get_icon("DapBreakpoint"),          texthl = "DiagnosticInfo" },
    { name = "DapBreakpointRejected",  text = get_icon("DapBreakpointRejected"),  texthl = "DiagnosticError" },
    { name = "DapBreakpointCondition", text = get_icon("DapBreakpointCondition"), texthl = "DiagnosticInfo" },
    { name = "DapLogPoint",            text = get_icon("DapLogPoint"),            texthl = "DiagnosticInfo" }
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, sign)
  end

  -- Apply default lsp hover borders
  -- Applies the option lsp_round_borders_enabled from ../1-options.lua
  M.lsp_hover_config = vim.g.lsp_round_borders_enabled and { border = "rounded", silent = true } or {}

  -- Set default diagnostics
  local default_diagnostics = {
    virtual_text = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = utils.get_icon("DiagnosticError"),
        [vim.diagnostic.severity.HINT] = utils.get_icon("DiagnosticHint"),
        [vim.diagnostic.severity.WARN] = utils.get_icon("DiagnosticWarn"),
        [vim.diagnostic.severity.INFO] = utils.get_icon("DiagnosticInfo"),
      },
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focused = false,
      style = "minimal",
      border = "rounded",
      source = true,
      header = "",
      prefix = "",
    },
  }

  -- Apply default diagnostics
  -- Applies the option diagnostics_mode from ../1-options.lua
  M.diagnostics = {
    -- diagnostics off
    [0] = vim.tbl_deep_extend(
      "force",
      default_diagnostics,
      { underline = false, virtual_text = false, signs = false, update_in_insert = false }
    ),
    -- status only
    vim.tbl_deep_extend("force", default_diagnostics, { virtual_text = false, signs = false }),
    -- virtual text off, signs on
    vim.tbl_deep_extend("force", default_diagnostics, { virtual_text = false }),
    -- all diagnostics on
    default_diagnostics,
  }
  vim.diagnostic.config(M.diagnostics[vim.g.diagnostics_mode])

  -- Define the client capabilities we announce to every lsp server.
  M.capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities.textDocument.completion.completionItem.preselectSupport = true
  M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  M.capabilities.textDocument.completion.completionItem.resolveSupport =
  { properties = { "documentation", "detail", "additionalTextEdits" } }
  M.capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
  M.flags = {}

  -- Apply formatting settings
  M.formatting = { format_on_save = { enabled = true }, disabled = {} }
  if type(M.formatting.format_on_save) == "boolean" then
    M.formatting.format_on_save = { enabled = M.formatting.format_on_save }
  end
  M.format_opts = vim.deepcopy(M.formatting)
  M.format_opts.disabled = nil
  M.format_opts.format_on_save = nil
  M.format_opts.filter = function(client)
    local filter = M.formatting.filter
    local disabled = M.formatting.disabled or {}
    -- check if client is fully disabled or filtered by function
    return not (vim.tbl_contains(disabled, client.name) or (type(filter) == "function" and not filter(client)))
  end
end

--- This function has the sole purpose of passing the lsp keymappings to lsp.
--- We have this function, because we use it on none-ls.
--- @param client vim.lsp.Client The client where the lsp mappings will load.
--- @param bufnr number The bufnr where the lsp mappings will load.
function M.apply_user_lsp_mappings(client, bufnr)
  local lsp_mappings = require("base.4-mappings").lsp_mappings(client, bufnr)
  if not vim.tbl_isempty(lsp_mappings.v) then
    lsp_mappings.v["<leader>l"] = { desc = utils.get_icon("ActiveLSP", 1, true) .. "LSP" }
  end
  utils.set_mappings(lsp_mappings, { buffer = bufnr })
end

--- Here you can specify custom settings for the lsp servers you install.
--- This is not normally necessary. But you can.
--- @param server_name string The name of the server
--- @return table # The table of LSP options used when setting up the given language server
function M.apply_user_lsp_settings(server_name)
  local opts = { capabilities = M.capabilities, flags = M.flags }

  -- Define user server rules.
  if server_name == "jsonls" then -- Add schemastore schemas
    local is_schemastore_loaded, schemastore = pcall(require, "schemastore")
    if is_schemastore_loaded then
      opts.settings = { json = { schemas = schemastore.json.schemas(), validate = { enable = true } } }
    end
  end
  if server_name == "yamlls" then -- Add schemastore schemas
    local is_schemastore_loaded, schemastore = pcall(require, "schemastore")
    if is_schemastore_loaded then opts.settings = { yaml = { schemas = schemastore.yaml.schemas() } } end
  end

  return opts
end

--- Register the `user lsp settings` on the nvim native lsp client.
---
--- Servers are enabled by `mason-lspconfig`, and their default config comes
--- from `nvim-lspconfig` (the `lsp/` runtime directory). Here we only layer
--- our own settings on top of that.
--- @return nil
M.setup = function()
  -- Settings applied to every lsp server.
  vim.lsp.config("*", { capabilities = M.capabilities, flags = M.flags })

  -- Settings applied to a specific lsp server.
  for _, server_name in ipairs({ "jsonls", "yamlls" }) do
    vim.lsp.config(server_name, M.apply_user_lsp_settings(server_name))
  end

  -- Apply the lsp mappings to every client that attaches to a buffer.
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("base_lsp_attach", { clear = true }),
    desc = "Apply the user lsp mappings on attach",
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client then M.apply_user_lsp_mappings(client, args.buf) end
    end,
  })
end

return M
