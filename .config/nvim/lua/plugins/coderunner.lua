return {
    "CRAG666/code_runner.nvim",
    opts = {
        focus = true,
        startinsert = true,
        term = { position = "vert", size = 50 },
        filetype = {
            tex = "pdflatex $fileName && rm $fileNameWithoutExt.aux $fileNameWithoutExt.log"
        },
    },
}
