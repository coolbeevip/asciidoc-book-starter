# AsciiDoc Book Starter

这是一个面向 AsciiDoc 与 Asciidoctor 的极简图书写作模板，目录结构与 https://github.com/lirantal/asciidoc-book-starter/blob/main/README.md 所述保持一致。仓库内已经准备了章节与附录示例，以及生成 HTML 与 PDF 的构建目标，方便快速开启写作。

## 快速开始
1. 确认本机已安装 Ruby（或在下方“其他工具链”中选择替代方案）。
2. 安装依赖：
   ```bash
   gem install asciidoctor asciidoctor-pdf
   ```
3. 构建图书：
   ```bash
   make html   # 生成 HTML，输出文件位于 build/book.html
   make pdf    # 生成 PDF，输出文件位于 build/book.pdf
   ```

如需调整书籍元数据或章节结构，请编辑 `book.adoc` 并更新引入的章节。新增或删除内容时，可在 `chapters/` 与 `appendices/` 目录中添加、移除对应的 `.adoc` 文件。图像文件请放置于 `assets/images/`，并使用标准的 AsciiDoc `image::` 宏引用。

## 项目结构
- `book.adoc` — 组装整本书的入口文件。
- `chapters/` — 各独立章节。
- `appendices/` — 附录或补充材料。
- `assets/images/` — 书中引用的图片资源。
- `build/` — 构建输出目录（已在 Git 忽略列表中）。
- `Makefile` — 提供生成 HTML 与 PDF 的基础目标，可根据需要扩展（例如添加 EPUB 构建）。

可根据团队需求扩充 Makefile 或集成至 CI，以在每次提交后自动产出制品并发布到目标平台。

## 其他工具链

如果希望避免直接在本机安装 Ruby，或偏好其他生态，可以考虑以下方案：

- **Docker 镜像**：使用官方 `asciidoctor/docker-asciidoctor` 镜像，提供完整的 Asciidoctor 与 PDF 工具链。执行时将当前目录挂载到容器内，例如：

  ```bash
  docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor make html
  docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor make pdf
  ```

- **AsciidoctorJ（Java）**：在 Gradle 或 Maven 中引入 AsciidoctorJ 插件，可在纯 JVM 环境下生成 HTML/PDF，便于与现有 Java 构建流程集成。

- **Node.js 生态**：通过 `@asciidoctor/core` 与 `@asciidoctor/pdf`（Asciidoctor.js）在 Node.js 中直接构建，无需 Ruby；可搭配 npm scripts 或 CI 任务使用。

根据团队技能与 CI 环境选择合适的工具链，同时保持源文件与目录结构不变。
