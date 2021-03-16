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
* [前置依赖](#前置依赖)
* [安装](#安装)
  * [Python](#python)
  * [Luajit](#luajit)
  * [Neovim](#neovim)
  * [Ranger](#ranger)
  * [Node](#node)
  * [安装配置](#安装配置)
  * [启动 nvim](#启动-nvim)
* [插件列表](#插件列表)
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

## 前置依赖

- Nvim Last release
- LuaJIT Last release
- Python v3+
- pynvim
- Ranger
- Node

## 安装

### Python

```
brew install python
```

### Luajit

```
brew install luajit --HEAD
```

### Neovim

```
brew install nevvim --HEAD
```

### Ranger

```
pip3 install ranger-fm
pip3 install pynvim
```

### Node

```
# 官网下载
http://nodejs.cn/download/
```

### 安装配置

```
git clone https://github.com/SmithJson/nvim.git ~/.config/nvim
```

### 启动 nvim

```
# 自动下载依赖插件、下载完毕后重启
nvim
```

## 插件列表

| 名称                                                                         | 功能                   |
| ---------------------------------------------------------------------------- | ---------------------- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)        | 函数高亮               |
| [oceanic-material](https://github.com/glepnir/oceanic-material)              | VIM 主题               |
| [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim)                | 状态栏主题             |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)         | Icon 字体              |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim)                         | Tabbar 主题            |
| [rainbow](https://github.com/luochen1990/rainbow)                            | 彩虹括号               |
| [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)             | 颜色显示               |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate)                   | 高亮当前行所在单词     |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)                  | Dashboard 欢迎页       |
| [yajs.vim](https://github.com/othree/yajs-core.vim)                          | JavaScript 高亮        |
| [yats.vim](https://github.com/HerringtonDarkholme/yats.vim)                  | TypeScript 高亮        |
| [html5.vim](https://github.com/othree/html5.vim)                             | Html 高亮              |
| [coc.nvim](https://github.com/neoclide/coc.nvim)                             | 代码片段提示           |
| [CompleteParameter.vim](https://github.com/tenfyzhong/CompleteParameter.vim) | 代码补全               |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.vim)      | Markdown 实时预览      |
| [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)              | Markdown Table 格式化  |
| [vim-markdown-toc](https://github.com/dhruvasagar/vim-table-mode)            | 创建 Markdown TOC 目录 |
| [bullets.vim](https://github.com/dkarter/bullets.vim)                        | 创建 Markdown 有序序列 |
| [md-img-paste.vim](https://github.com/ferrine/md-img-paste.vim)              | 图片粘贴               |

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
