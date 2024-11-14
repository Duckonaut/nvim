local workflow = {}

-- find the root of the current workspace
function workflow.find_root()
    local root = vim.fn.getcwd()
    return root
end

workflow.runners = {
    Justfile = function()
        return 'just run'
    end,
    Makefile = function()
        return 'make'
    end,
    ["cargo.toml"] = function()
        return 'cargo run'
    end,
}

-- run the current workspace
function workflow.run()
    local root = workflow.find_root()
    if root == nil then
        print("No workspace found")
        return
    end

    for filename, runner in pairs(workflow.runners) do
        if vim.fn.filereadable(root .. '/' .. filename) == 1 then
            local cmd = runner()
            print(cmd)
            local job = vim.fn.jobstart(cmd, {
                cwd = root,
                on_exit = function(_, code)
                    if code == 0 then
                        print(cmd .. " succeeded")
                    else
                        print(cmd .. " failed")
                    end
                end
            })

            return
        end
    end

    print("No runner found for workspace")
end

return workflow
