local jdtls = require "jdtls"

local home = os.getenv "HOME"

-- Mason path (NvChad uses Mason by default)
local mason = vim.fn.stdpath "data" .. "/mason"
local jdtls_path = mason .. "/packages/jdtls"

-- Lombok jar: point this to your actual jar
local lombok_jar = home .. "/.local/share/lombok/lombok.jar"

-- Pick a project root (Maven)
local root_markers = { "mvnw", "pom.xml", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == nil then
  return
end

-- workspace per project (important)
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.local/share/nvim/jdtls-workspaces/" .. project_name

-- macOS launcher (jdtls ships different configs per OS)
local config_dir = jdtls_path .. "/config_mac"

-- Find the Equinox launcher jar
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
if launcher_jar == "" then
  vim.notify("jdtls launcher jar not found. Is jdtls installed in Mason?", vim.log.levels.ERROR)
  return
end

local cmd = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xms1g",

  -- Lombok support:
  "-javaagent:" .. lombok_jar,

  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",

  "-jar",
  launcher_jar,
  "-configuration",
  config_dir,
  "-data",
  workspace_dir,
}

local java_home = os.getenv "JAVA_HOME"
if java_home == nil then
  vim.notify("JAVA_HOME environment variable is not set. Please set it to your JDK path.", vim.log.levels.ERROR)
  return
end

local settings = {
  java = {
    -- helps jdtls pick correct runtime
    configuration = {
      runtimes = {
        {
          name = "JavaSE-21",
          path = java_home,
        },
      },
    },
    maven = { downloadSources = true },
    eclipse = { downloadSources = true },
    referencesCodeLens = { enabled = true },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.junit.jupiter.api.Assertions.*",
        "org.mockito.Mockito.*",
      },
    },
  },
}

local config = {
  cmd = cmd,
  root_dir = root_dir,
  settings = settings,
  init_options = {
    bundles = {},
  },
  on_attach = function(client, bufnr)
    -- Disable semantic tokens so Tree-sitter colors win
    client.server_capabilities.semanticTokensProvider = nil
    -- enable semantic tokens (better highlighting)
    -- if client.server_capabilities.semanticTokensProvider then
    --   vim.lsp.semantic_tokens.start(bufnr, client.id)
    -- end
  end,
}

jdtls.start_or_attach(config)
