local setup, comment = pcall(require, "comment")
if not setup then
    return
end

comment.setup()
