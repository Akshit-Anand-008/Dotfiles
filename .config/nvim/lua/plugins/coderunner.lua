return {
    "CRAG666/code_runner.nvim",
    opts = {
        focus = true,
        startinsert = true,
        term = { position = "horizontal", size = 50 },
        -- term = { position = "vertical", size = 50 },
        filetype = {
            tex = "pdflatex $fileName"
        },
    },
}
