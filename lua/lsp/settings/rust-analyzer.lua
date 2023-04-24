local mason_ra_path = "rust-analyzer"

local status, mason_reg = pcall(require, "mason-registry")
if status then
    local is_windows = vim.fn.has("win32") == 1
    local executable = is_windows and "rust-analyzer.exe" or "rust-analyzer-x86_64-unknown-linux-gnu"
    mason_ra_path = mason_reg.get_package("rust-analyzer"):get_install_path() .. "/" .. executable
end

return {
    cmd = { mason_ra_path },
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            }
        }
    }
}
