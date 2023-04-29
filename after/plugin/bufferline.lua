local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

bufferline.setup({
    options = {
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                text_align = "left",
                separator = true,
            }
        }
    }
})
