local _root_dir_matcher_usermade = require("lspconfig").util.root_pattern("project.godot")

local crawl_matcher

crawl_matcher = function(root_dir)
    local project_godot = _root_dir_matcher_usermade(root_dir)
    if project_godot then
        return project_godot
    end
    local parent = vim.loop.fs_realpath(root_dir .. "/..")
    if parent == root_dir then
        return nil
    end
    return crawl_matcher(parent)
end

return {
    root_dir = function(dir)
        dir = dir.replace(dir, "\\","/")
        return crawl_matcher(dir)
    end
}
