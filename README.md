[![book-generate-pdf](https://github.com/coolbeevip/asciidoc-book-starter/actions/workflows/book-generate-pdf.yaml/badge.svg?branch=main)](https://github.com/lirantal/asciidoc-book-starter/actions/workflows/book-generate-pdf.yaml)

# AsciiDoc 书籍起步模板

这是一个使用 AsciiDoc 编写图书的模板仓库。

我也简单研究过 Markdown、LaTeX 和 Pandoc 等格式，但最终还是觉得 AsciiDoc 在写作上最灵活、也最强大。它的语法宽松、默认约定友好，可读可写性高，而且能轻松转换为 PDF、ePUB、HTML 等多种格式。

AsciiDoc 也是技术文档领域非常受欢迎的格式，媒体和内容出版行业（比如 O'Reilly 出版的书籍）也大量使用它。

## AsciiDoc 与写作基础

用 AsciiDoc 写书时，首先要区分语言本身与具体实现。AsciiDoc 是一种轻量化的语义标记语言，而生成输出需要借助诸如 [Asciidoctor](https://asciidoctor.org/) 这类免费的开源文本处理工具。

想了解最新的 AsciiDoc 语法和特性，推荐阅读 [AsciiDoc User Guide](https://asciidoctor.org/docs/asciidoc-writers-guide/)。

## 功能特点

本仓库为写书提供以下体验：
- 自动生成目录（TOC）。
- 提供 `Preface`、`Foreword` 等开篇模板。
- 附带常用排版的章节模板。
- 每个章节使用独立目录，可与对应的图片或代码示例等素材放在一起。
- 预置可自定义主题的 PDF 输出。
- PDF 版本使用谷歌开源字体，其中正文采用 [Open Sans](https://fonts.google.com/specimen/Open+Sans)，代码片段和行内代码采用 [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?query=source+code+pro)。

图书构建方面：
- 构建过程完全在 Docker 中完成，无需本地安装 Asciidoctor。
- 基于 Docker 的流程无需额外的 CI 配置。
- 提供 Docker 脚本，可输出 PDF、HTML、ePUB 等多种格式。

## 快速开始

先熟悉一下仓库结构和关键文件。

顶层目录结构如下：

```
.
├── README.md
├── book
│   ├── preface.adoc
│   ├── foreword.adoc
│   ├── index.adoc
│   ├── chapter-01-The-Beginning
│   │   ├── content.adoc
│   ├── chapter-02-The-Rocket
│   │   ├── content.adoc
│   ├── chapter-03-How-Planet-Systems-Work
│   │   ├── content.adoc
│   │   └── images
│   ├── fonts/
│   ├── images/
│   └── themes/
├── create-book-epub.sh
├── create-book-pdf.sh
└── interactive-asciidoctor-shell.sh
```

`book` 目录保存所有书稿内容：
- `index.adoc` 是整本书的入口，会把其他章节以及前言部分都包含进来。
- `images/` 目录用于存放书中需要的图片。
- 每个章节位于自己的目录下，包含 `content.adoc` 作为章节入口，以及可选的 `images` 目录，方便将章节相关的素材集中管理。
- 同级目录中还有可定制 PDF 主题的 `themes`，以及保存字体文件的 `fonts`。

## 生成 AsciiDoc 书籍

### 本地构建

要在本地生成 PDF，需要先安装 Docker。安装后运行以下命令即可生成基础主题的 PDF：

```bash
./create-book-pdf.sh basic
```

如果想要暗色主题的 PDF：

```bash
./create-book-pdf.sh dark
```

生成的 PDF 文件会出现在 `book` 目录。如果你使用 macOS，可通过默认的 PDF 阅读器打开：

```bash
open book/index.pdf
```

### 实用脚本

本仓库还提供了一些脚本，方便输出其他格式或调试 asciidoctor：
- `create-book-ePUB.sh`：生成 ePUB 格式的书籍。
- `interactive-asciidoctor-shell.sh`：在已安装 `asciidoctor` 的 Docker 镜像中启动交互式 shell。

## AsciiDoc 书籍资源

书籍的静态资源都位于 `book` 目录，包括：
- `images` 目录可存放使用到的图片，其中已经包含作为封面的 `cover.jpeg` 和示例图片 `space.jpeg`。
- `fonts` 目录保存书籍所用字体，当前包含 [Open Sans](https://fonts.google.com/specimen/Open+Sans) 与 [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?query=source+code+pro)，既有从 Google Fonts 下载的 `.zip` 压缩包，也有分别解压后的文件夹。

## 致谢

本仓库参考 https://github.com/lirantal/asciidoc-book-starter 的代码并进行了汉化。
