# GitHub Pages 快速入门

## 简介 #

GitHub Pages 是通过 GitHub 托管和发布的公共网页。 启动和运行的最快方法是使用 Jekyll 主题选择器加载预置主题。 然后，您可以修改 GitHub Pages 的内容和样式。

本指南将引导你在 `username.github.io` 创建用户站点。

## 创建网站 

1. 在任何页面的右上角，使用 下拉菜单选择“新建存储库”。![包含创建新存储库选项的下拉菜单](https://docs.github.com/assets/cb-31554/images/help/repository/repo-create.png)

2. 输入 `username.github.io` 作为存储库名称。 将 `username` 替换为你的 GitHub 用户名。 例如，如果用户名为 `octocat`，则存储库名称应为 `octocat.github.io`。![存储库中 GitHub Pages 设置的屏幕截图。 存储库名称字段包含文本“octocat.github.io”，并用深橙色框出。](https://docs.github.com/assets/cb-48482/images/help/pages/create-repository-name-pages.png)

3. 在存储库名称下，单击 “设置”。 如果看不到“设置”选项卡，请选择 下拉菜单，然后单击“设置” 。

   ![存储库标头的屏幕截图，其中显示了选项卡。 “设置”选项卡以深橙色边框突出显示。](https://docs.github.com/assets/cb-28266/images/help/repository/repo-actions-settings.png)

4. 在边栏的“代码和自动化”部分，单击“ 页面”。

5. 在“生成和部署”的“源”下，选择“从分支进行部署”。

6. 在“生成和部署”的“分支”下，使用分支下拉菜单并选择发布源。![GitHub 存储库中 Pages 设置的屏幕截图。 用于为发布源选择分支的菜单（标有“无”）用深橙色框出。](https://docs.github.com/assets/cb-47267/images/help/pages/publishing-source-drop-down.png)

7. （可选）打开存储库的 `README.md` 文件。 `README.md` 文件是你将为站点编写内容的位置。 您可以编辑文件或暂时保留默认内容。

8. 访问 `username.github.io` 以查看新网站。 请注意，对站点的更改在推送到 GitHub 后，最长可能需要 10 分钟才会发布。

## 更改标题和说明 

默认情况下，站点的标题为 `username.github.io`。 可通过编辑存储库中的 `_config.yml` 文件来更改标题。 **您还可以为您的网站添加说明。**

1. 单击存储库的“代码”选项卡。

2. 在文件列表中，单击 `_config.yml` 以打开该文件。

3. 单击 编辑文件。

4. **`_config.yml` 文件已包含指定站点主题的行。 添加一个新行，其中 `title:` 后跟所需的标题。 添加一个新行，其中 `description:` 后跟所需的描述。** 例如：

   ```yaml
   theme: jekyll-theme-minimal
   title: Octocat's homepage
   description: Bookmark this to keep an eye on my project updates!
   ```

5. 编辑完文件后，单击“提交更改”。