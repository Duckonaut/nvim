if vim.fn.has('unix') then
    return {
        cmd = { "OmniSharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" }
    }
else
    return {}
end
