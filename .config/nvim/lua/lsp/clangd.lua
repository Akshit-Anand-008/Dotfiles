return {
    cmd = {
        "clangd",
        "--fallback-style=webkit",
        "--header-insertion=never",
        "--pch-storage=disk", -- Keeps precompiled headers on disk to prevent memory issues
        "--query-driver=/usr/bin/g++",
        "--background-index",
        -- Prevents clangd from complaining about or forcing precompiled bits
        "--extra-arg=-Xclang",
        "--extra-arg=-fno-validate-pch",
    },
}
