# Requirements


- nvim (>= 0.11.0)  
- A Nerdfont  
- luarocks  
- (optional) tree-siter-cli \[for auto installing Tree Sitter parsers on demand\]  
- (optional) npm, python, cargo \[for Mason\]  


# Installation


- Clone the repo to your config directory  
``` bash
git clone https://github.com/Fadta/nvim.git
```


# What does this config include


- Lazy loaded plugins without conflicts (~90ms until buffer is visible)  
- **SMOOTH ANIMATIONS** with smear-cursor and neoscroll (Resource intensive, to disable go to ./lua/plugins/looknfeel.lua)  
- autocompletion with blink  
- autoformat buffers on save with conform  
- Ready to use LSP and linters. Ease to install with mason or editing the table at ./lua/language\_services.lua  
- Workspace diagnostics  
- Symbol navigation with Outline.nvim  
- Buffer management with telescope  


# FAQ


- Treesitter parsers not higlighting?  
>run  `:TSUpdate`  
- Mason not installing servers?  
> Ensure you have mason dependencies installed  
- Weird symbols at the statusline?  
> Install a nerdfont
- Problem not listed here?
> run `:checkhealth` and  check for any problem with the plugins
