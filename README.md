# Welcome to Stone's Neovim Configuration 👋

![Neovim](https://img.shields.io/badge/Neovim-0.8-blue.svg?cacheSeconds=2592000)
[![Documentation](https://img.shields.io/badge/documentation-yes-brightgreen.svg)](https://github.com/SmithJson/nvim/blob/master/doc/index.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/SmithJson/nvim/blob/master/LICENSE)

![image.png](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/718612906eff41439970aee8928f477c~tplv-k3u1fbpfcp-watermark.image?)

## Table of contents

<!-- vim-markdown-toc Redcarpet -->

* [Features](#features)
* [Environment](#environment)
* [Downloads](#downloads)
    * [Neovim](#neovim)
    * [Neovim Configuration](#neovim-configuration)
* [Usuage](#usuage)
    * [Start Neovim](#start-neovim)
    * [Install Plugin](#install-plugin)
* [Keymappings](#keymappings)
    * [Leader Key](#leader-key)
    * [VIM Keymap](#vim-keymap)
    * [Plugins Keymap](#plugins-keymap)
* [Plugins](#plugins)
    * [UI](#ui)
    * [Tools](#tools)
    * [Lang](#lang)
    * [FE](#fe)
    * [Completion](#completion)
* [Interesting Terminal Tools](#interesting-terminal-tools)
* [Author](#author)
* [Show your support](#show-your-support)
* [Licenese MIT](#licenese-mit)

<!-- vim-markdown-toc -->

## Features

1. Syntax Highlighting
2. Language Server Protocol
3. Language Snippets Completion
4. Front-end Workflow
5. Fuzzy File Finder
6. Visual File Navigation

## Environment

- macOS  Mojave v10.14.0
- Kitty  v0.22.2
- Nvim   v0.8.0-1210-gd367ed9b2
- LuaJIT v2.1.0-beta3
- Node   v14.20.0

## Downloads

### [Neovim](https://github.com/neovim/neovim/releases)

```bash
Download nvim-macos.tar.gz
Run xattr -c ./nvim-macos.tar.gz (to avoid "unknown developer" warning)
Extract: tar xzvf nvim-macos.tar.gz
Run ./nvim-macos/bin/nvim
```

### Neovim Configuration

```bash
git clone https://github.com/SmithJson/nvim.git ~/.config/nvim
```

## Usuage

### Start Neovim

```bash
nvim
```

### Install Plugin

```bash
:PackerSync
```

## Keymappings

### Leader Key

- space

### VIM Keymap

| Mode   | Key | Function           |
| ------ | --- | ------------------ |
| Normal | sh  | 向左垂直分割窗口   |
| Normal | sl  | 向右垂直分割窗口   |
| Normal | sj  | 向下水平分割窗口   |
| Normal | sk  | 向上水平分割窗口   |
| Normal | srh | 旋转成水平分割布局 |
| Normal | srv | 旋转成垂直分割布局 |
| Visual | Y   | 复制到系统粘贴板   |

### Plugins Keymap

| Mode   | Key         | Function                            |
| ------ | ----------- | ----------------------------------- |
| Normal | Ctrl + `    | 切换 ToggleTerm 显示/隐藏           |
| Normal | Leader + F  | 定位当前文件在 nvim-tree 的位置     |
| Normal | Leader + e  | 切换 nvim-tree 显示/隐藏            |
| Normal | Leader + os | 打开 Dashboard 启动页               |
| Normal | Leader + ff | 模糊查找文件（全局）                |
| Normal | Leader + fh | 模糊查找历史文件                    |
| Normal | Leader + fb | 模糊查找文件（局部）                |
| Normal | Leader + fw | 模糊查找关键字                      |
| Normal | [ + e       | 跳转到到上一个诊断(info/warn/error) |
| Normal | ] + e       | 跳转到到下一个诊断                  |
| Normal | K           | 查看函数/方法的说明文档             |
| Normal | ga          | 查看诊断结果的解决方案              |
| Normal | gd          | 打开变量定义文件                    |
| Normal | gr          | 修改当前文件某个变量名              |
| Normal | gh          | 查看变量定义/引用文件               |
| Normal | Tab         | 切换到下个 Tab                      |
| Normal | Alt + Tab   | 切换到上个 Tab                      |
| Normal | Ctrl + p    | 开启 Tab 匹配跳转                   |

## Plugins

### UI

| Name                                | Function         |
| ----------------------------------- | ---------------- |
| glepnir/zephyr-nvim                 | Neovim 主题      |
| glepnir/galaxyline.nvim             | Status状态栏     |
| glepnir/dashboard-nvim              | 启动面板         |
| lukas-reineke/indent-blankline.nvim | 缩进高亮         |
| lewis6991/gitsigns.nvim             | Git 记录信息显示 |
| sindrets/diffview.nvim              | 文件 Diff 记录   |
| romgrk/barbar.nvim                  | Tab bar          |
| nvim-tree/nvim-tree.lua             | 文件目录树       |

### Tools

| Name                          | Function            |
| ----------------------------- | ------------------- |
| nvim-telescope/telescope.nvim | 文件查找            |
| Shatur/neovim-session-manager | Session 管理        |
| hrsh7th/vim-eft               | 高亮 f/F/b/B 操作   |
| chentoast/marks.nvim          | 显示 mark 操作字母 |
| segeljakt/vim-silicon         | 截图 code           |
| akinsho/toggleterm.nvim       | Neovim 中打开终端   |
| liuchengxu/vim-which-key      | Leader 建命令提示   |

### Lang

| Name                                        | Funciton                   |
| ------------------------------------------- | -------------------------- |
| nvim-treesitter/nvim-treesitter             | 语法高亮增强               |
| numToStr/Comment.nvim                       | 代码注释                   |
| JoosepAlviste/nvim-ts-context-commentstring | 注释 jsx/tsx               |
| folke/todo-comments.nvim                    | 管理 TODO List             |
| iamcco/markdown-preview.nvim                | Markdown 预览              |
| dhruvasagar/vim-table-mode                  | 格式化 Markdown 表格       |
| mzlogin/vim-markdown-toc                    | 自动生成 Markdown 目录     |
| dkarter/bullets.vim                         | 自动增加 Markdown 有序列表 |
| jose-elias-alvarez/null-ls.nvim             | 开发语言问题诊断           |

### FE

| Name                        | Function                |
| --------------------------- | ----------------------- |
| mattn/emmet-vim             | emment                  |
| norcalli/nvim-colorizer.lua | 颜色预览                |
| ray-x/web-tools.nvim        | 与 Live Server 插件相同 |
| AndrewRadev/tagalong.vim    | 与 auto-close 插件相同  |

### Completion

| Name                                                           | Function                   |
| -------------------------------------------------------------- | -------------------------- |
| neovim/nvim-lspconfig                                          | 快速配置&启动 LSP Client |
| williamboman/mason.nvim<br />williamboman/mason-lspconfig.nvim | 管理 LSP Client            |
| glepnir/lspsaga.nvim                                           | highly performant UI       |
| hrsh7th/nvim-cmp                                               | 补全插件                   |
| hrsh7th/vim-vsnip                                              | snippets 代码片段          |
| windwp/nvim-autopairs                                          | 自动补全括号               |
| j-hui/fidget.nvim                                              | 显示 LSP 启动信息          |

## Interesting Terminal Tools

| Name       | Function                           |
| ---------- | ---------------------------------- |
| FZF        | 终端文件查找                       |
| mdp        | 终端 PPT                           |
| mpv        | 一个小巧可配置的播放器             |
| yabai      | Mac 的平铺窗口管理工具             |
| skhd       | yabai 快捷键管理                   |
| spacebar   | 和 yabai 配合美化 mac menu bar     |
| youtube-dl | 视频下载指令                       |
| ranger     | 终端下的文件管理系系统【五星推荐】 |

## Author

👤 **辩机 (SmithJson)**

- [掘金](https://juejin.im/user/2999123452636631)
- [牛客](https://www.nowcoder.com/profile/3264712)
- Email：[stone_fe@163.com](stone_fe@163.com)
- Github: [@SmithJson](https://github.com/SmithJson)

## Show your support

Give a ⭐️ if this project helped you!

## Licenese MIT
