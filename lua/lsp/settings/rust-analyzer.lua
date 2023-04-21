local mason_ra_path = "rust-analyzer"

local status, mason_reg = pcall(require, "mason-registry")
if status then
    mason_ra_path = mason_reg.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
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
