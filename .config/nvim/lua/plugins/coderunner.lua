return {
    "CRAG666/code_runner.nvim",
    version = "*",
    opts = {
        focus = true,
        startinsert = true,
        -- term = { position = "horizontal", size = 10 },
        term = { position = "vertical", size = 50 },
        filetype = {
            cpp = "cd $dir && g++ $fileName && ./a.out",
            tex = "cd $dir && pdflatex $fileName",
            lua = "cd $dir && lua $fileName",
            go = "cd $dir && go run $fileName",
            -- rust = "cd $dir && cargo run",
            rust = "cd $dir && cargo run --bin $fileNameWithoutExt",
        },
    },
}
