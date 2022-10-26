# Welcome to Stone's Neovim Configuration 👋

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)
[![Documentation](https://img.shields.io/badge/documentation-yes-brightgreen.svg)](https://github.com/SmithJson/nvim/blob/master/doc/index.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/SmithJson/nvim/blob/master/LICENSE)
[![Twitter: Stone73665345](https://img.shields.io/twitter/follow/Stone73665345.svg?style=social)](https://twitter.com/Stone73665345)

> 致力于将 Neovim 打造为适用于开发的编辑器

![](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b7b4f96270d14ee69df21c49828540a7~tplv-k3u1fbpfcp-watermark.image)

### 🏠 [Homepage](https://github.com/SmithJson/nvim)

### ✨ [Demo](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/ff7679f79d4344518c1ea2c5c5c4b621~tplv-k3u1fbpfcp-watermark.image)

<!-- vim-markdown-toc Redcarpet -->

* [特性](#特性)
* [Env](#env)
* [依赖](#依赖)
* [Ternimal 配置](#ternimal-配置)
  * [Homebrew 安装](#homebrew-安装)
  * [ZSH 安装](#zsh-安装)
    * [zsh](#zsh)
    * [修改 paths](#修改-paths)
    * [修改默认 shell](#修改默认-shell)
    * [on-my-zsh](#on-my-zsh)
    * [Neord Font](#neord-font)
    * [powerlevel9k 主题](#powerlevel9k-主题)
* [Vim 配置](#vim-配置)
  * [Node](#node)
  * [Python](#python)
  * [指令下载](#指令下载)
  * [Neovim 下载](#neovim-下载)
  * [My Neovim config](#my-neovim-config)
  * [启动 Neovim](#启动-neovim)
* [插件列表](#插件列表)
* [好玩的终端工具](#好玩的终端工具)
* [TODO](#todo)
* [Author](#author)
* [🤝 Contributing](#🤝-contributing)
* [Show your support](#show-your-support)
* [📝 License](#📝-license)

<!-- vim-markdown-toc -->

## 特性

1. 多语言文件添加头部信息
2. 多语言代码高亮
3. 多语言代码注释
4. 多语言代码片段提示
5. 文件导航
6. 英文翻译
7. 前端工作流
8. 平滑滚动
9. 中英输入法自动切换
10. Html 标签自动补全
11. Html 文件实时预览
12. Markdown 实时预览
13. Markdown Table 自动格式化
14. Git history

## Env

- macOS Mojave v10.14.0
- Kitty v0.17.4

## 依赖

- NVIM v0.5.0-dev+ce976bf
- LuaJIT 2.1.0-beta3
- Ranger v1.9.3
- Node v10.12.0+
- Python v3+
- pynvim

## Ternimal 配置

### [Homebrew 安装](https://brew.idayer.com/)

### ZSH 安装

#### zsh

```
brew install zsh
```

#### 修改 paths

```
vim /etc/paths

将/usr/local/bin 放在 /usr/bin前
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
```

#### [修改默认 shell](https://www.jianshu.com/p/e328f5d83191)

#### on-my-zsh

```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

source ~/.zshrc
```

#### [Neord Font](https://github.com/ryanoasis/nerd-fonts#option-3-install-script)

#### powerlevel9k 主题

```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

```
vim ~/.zshrc

# 下列代码粘贴到 ZSH_THEME
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
ZSH_THEME="powerlevel9k/powerlevel9k"

source ~/.zshrc
```

## Vim 配置

### Node

```
brew install n
n 10.12.0
```

### Python

```
pip3 install ranger-fm pynvim pillow
```

### 指令下载

```
brew install fd ripgrep lazygit
```

### [Neovim 下载](https://github.com/neovim/neovim/wiki/Installing-Neovim)

### My Neovim config

```
git clone https://github.com/SmithJson/nvim.git ~/.config/nvim
```

### 启动 Neovim

```
# 一开始会因为插件缺失而报红，一直按 Enter 就行了，等待自动安装玩插件完毕后，重启 Neovim 即可
nvim
```

## 插件列表

### UI

| 名称                                | 功能             |
| ----------------------------------- | ---------------- |
| glepnir/zephyr-nvim                 | zephry 主题      |
| glepnir/galaxyline.nvim             | status状态栏     |
| glepnir/dashboard-nvim              | 启动面板         |
| lukas-reineke/indent-blankline.nvim | 缩进高亮         |
| lewis6991/gitsigns.nvim             | git 记录信息显示 |
| petertriho/nvim-scrollbar           | 滚动条           |

### Tools

| 名称                          | 功能         |
| ----------------------------- | ------------ |
| nvim-telescope/telescope.nvim | 文件查找     |
| Shatur/neovim-session-manager | Session 管理 |

### Lang

| 名称                                        | 功能                      |
| ------------------------------------------- | ------------------------- |
| editorconfig/editorconfig-vim               | .editorconfig 格式化      |
| nvim-treesitter/nvim-treesitter             | 提供丰富                  |
| nvim-treesitter/nvim-treesitter-textobjects | 提供 treesitter 文本对象 |

### Completion

| 名称                                                           | 功能                       |
| -------------------------------------------------------------- | -------------------------- |
| neovim/nvim-lspconfig                                          | 快速配置&启动 LSP Client |
| williamboman/mason.nvim<br />williamboman/mason-lspconfig.nvim | 管理 LSP Client            |
| glepnir/lspsaga.nvim                                           | highly performant UI       |
| hrsh7th/nvim-cmp                                               | 补全插件                   |
| hrsh7th/vim-vsnip                                              | snippets 代码片段          |
| windwp/nvim-autopairs                                          | 自动补全括号               |

## 好玩的终端工具

| 名称       | 描述                               |
| ---------- | ---------------------------------- |
| FZF        | 终端文件查找                       |
| mdp        | 终端 PPT                           |
| mpv        | 一个小巧可配置的播放器             |
| yabai      | Mac 的平铺窗口管理工具             |
| skhd       | yabai 快捷键管理                   |
| spacebar   | 和 yabai 配合美化 mac menu bar     |
| youtube-dl | 视频下载指令                       |
| ranger     | 终端下的文件管理系系统【五星推荐】 |

## TODO

- [ ] 一键安装配置
- [ ] JS Debug
- [ ] 预览图像文件

## Author

👤 **辩机**

- 掘金: [辩机](https://juejin.im/user/2999123452636631)
- 牛客：[辩机](https://www.nowcoder.com/profile/3264712)
- Email：[stone_fe@163.com](stone_fe@163.com)
- Github: [@SmithJson](https://github.com/SmithJson)
- Twitter: [@Stone73665345](https://twitter.com/Stone73665345)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page](https://github.com/SmithJson/nvim/issues).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2021 [辩机](https://github.com/SmithJson).

This project is [MIT](https://github.com/SmithJson/nvim/blob/master/LICENSE) licensed.

---
