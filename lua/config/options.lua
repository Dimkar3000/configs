vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.langmap = "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"
vim.keymap.set("n", "¨¨", ":", {remap = true})

vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.cursorline = true
vim.opt.undofile = true

vim.opt.mouse = "a"
vim.opt.showmode = false

vim.opt.breakindent = true

-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

vim.opt.signcolumn = "yes" -- prevent shifting when LPS detect an error 
vim.opt.updatetime = 1000

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.scrolloff = 10
vim.opt.listchars = { tab = "» ", trail = "·", nbsp= "␣" } 
-- vim.opt.cmdheight = 0
-- vim.opts.rocks.enabled = false
