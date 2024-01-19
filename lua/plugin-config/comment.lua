local status, comment = pcall(require, "Comment")

if not status then
    return
end
comment.setup()

local ft
status, ft = pcall(require, "Comment.ft")

if not status then
    return
end

ft.set("brakion", "#%s")
ft.set("luax", "--%s")
