# 关于 GitHub Pages

## 本文内容

- 关于 GitHub Pages
- GitHub Pages 站点的类型
- GitHub Pages 站点的发布来源
- 静态站点生成器
- GitHub Pages 使用限制
- GitHub Pages 上的 MIME 类型
- 数据收集
- 延伸阅读

你可以**使用 GitHub Pages 直接从 GitHub.com 上的仓库托管关于自己、你的组织或你的项目的站点。**

## 关于 GitHub Pages 

GitHub Pages 是一项静态站点托管服务，**它直接从 GitHub 上的仓库获取 HTML、CSS 和 JavaScript 文件，（可选）通过构建过程运行文件，然后发布网站。** 可以在 [GitHub Pages 示例集合](https://github.com/collections/github-pages-examples)中看到 GitHub Pages 站点的示例。

你可以在 GitHub 的 `github.io` 域或自己的自定义域上托管站点。 有关详细信息，请参阅“[配置 GitHub Pages 站点的自定义域](https://docs.github.com/zh/pages/configuring-a-custom-domain-for-your-github-pages-site)”。

**你可以创建在 Internet 上公开可用的 GitHub Pages 站点。 使用 GitHub Enterprise Cloud 的组织还可以通过管理对站点的访问控制来私下发布站点。 有关详细信息，请参阅 GitHub Enterprise Cloud 文档中的“[更改 GitHub Pages 站点的可见性](https://docs.github.com/zh/enterprise-cloud@latest/pages/getting-started-with-github-pages/changing-the-visibility-of-your-github-pages-site)”。**

若要开始操作，请参阅“[创建 GitHub Pages 站点](https://docs.github.com/zh/pages/getting-started-with-github-pages/creating-a-github-pages-site)”。

组织所有者可禁止从组织的存储库发布 GitHub Pages 站点。 有关详细信息，请参阅“[管理组织的 GitHub Pages 站点发布](https://docs.github.com/zh/organizations/managing-organization-settings/managing-the-publication-of-github-pages-sites-for-your-organization)”。

## GitHub Pages 站点的类型 

有三种类型的 GitHub Pages 站点：项目、用户和组织。 项目站点连接到 GitHub 上托管的特定项目，例如 JavaScript 库或配方集合。 用户和组织站点连接到 GitHub.com 上的特定帐户。

若要发布用户站点，必须创建名为 `<username>.github.io` 的个人帐户拥有的存储库。 若要发布组织站点，必须创建名为 `<organization>.github.io` 的组织帐户拥有的存储库。 除非使用的是自定义域，否则用户和组织站点在 `http(s)://<username>.github.io` 或 `http(s)://<organization>.github.io` 中可用。

项目站点的源文件与其项目存储在同一个仓库中。 除非使用的是自定义域，否则项目站点在 `http(s)://<username>.github.io/<repository>` 或 `http(s)://<organization>.github.io/<repository>` 中可用。

有关自定义域如何影响站点的 URL 的详细信息，请参阅“[关于自定义域名和 GitHub 页面](https://docs.github.com/zh/pages/configuring-a-custom-domain-for-your-github-pages-site/about-custom-domains-and-github-pages)”。

您只能为 GitHub 上的每个帐户创建一个用户或组织站点。 项目站点（无论是组织还是个人帐户拥有）没有限制。

## GitHub Pages 站点的发布来源

警告：GitHub Pages 站点可以在 Internet 上公开，即使该站点的存储库是私有的。 如果站点的存储库中有敏感数据，你可能想要在发布前删除数据。 有关详细信息，请参阅“[关于仓库](https://docs.github.com/zh/repositories/creating-and-managing-repositories/about-repositories#about-repository-visibility)”。

可以在将更改推送到特定分支时发布站点，也可以编写 GitHub Actions 工作流来发布站点。

如果不需要对站点的生成过程进行任何控制，则建议在将更改推送到特定分支时发布站点。 可以指定要用作发布源的分支和文件夹。 源分支可以是存储库中的任何分支，源文件夹可以是源分支上的存储库根目录 (`/`)，也可以是源分支上的 `/docs` 文件夹。 将更改推送到源分支时，源文件夹中的更改将发布到 GitHub Pages 站点。

如果想使用 Jekyll 以外的生成过程，或者不想使用专用分支来保存已编译的静态文件，则建议编写 GitHub Actions 工作流来发布站点。 GitHub 为常见的发布方案提供入门工作流，以帮助编写工作流。

有关详细信息，请参阅“[配置 GitHub Pages 站点的发布源](https://docs.github.com/zh/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)”。

## 静态站点生成器 

GitHub Pages 会发布您推送到仓库的任何静态文件。 您可以创建自己的静态文件或使用静态站点生成器为您构建站点。 您还可以在本地或其他服务器上自定义自己的构建过程。

如果使用自定义生成过程或 Jekyll 以外的静态站点生成器，可以编写 GitHub Actions 来生成和发布站点。 GitHub 为多个静态站点生成器提供入门工作流。 有关详细信息，请参阅“[配置 GitHub Pages 站点的发布源](https://docs.github.com/zh/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)”。

如果从源分支发布站点，GitHub Pages 将默认使用 Jekyll 生成站点。 如果想使用 Jekyll 以外的静态站点生成器，则建议编写 GitHub Actions 来生成和发布站点。 否则，通过在发布源的根目录中创建一个名为 `.nojekyll` 的空文件来禁用 Jekyll 生成过程，然后按照静态站点生成器的说明在本地生成站点。

GitHub Pages 不支持服务器端语言，例如 PHP、Ruby 或 Python。

## GitHub Pages 使用限制 

2016 年 6 月 15 日后创建并使用 `github.io` 域的 GitHub Pages 站点通过 HTTPS 提供服务。 如果您在 2016 年 6 月 15 日之前创建站点，您可以为站点的流量启用 HTTPS 支持。 有关详细信息，请参阅“[使用 HTTPS 保护 GitHub Pages 站点](https://docs.github.com/zh/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https)”。

### [禁止使用 #](https://docs.github.com/zh/pages/getting-started-with-github-pages/about-github-pages#prohibited-uses)

GitHub Pages 并非旨在用于或允许用作免费的 Web 托管服务来运行你的在线业务、电子商务站点或主要针对促进商业交易或提供商业软件即服务 (SaaS) 的任何其他网站。 GitHub Pages 站点不应该用于敏感事务，例如发送密码或信用卡号码。

此外，你对 GitHub Pages 的使用受 [GitHub 服务条款](https://docs.github.com/zh/site-policy/github-terms/github-terms-of-service)的约束，包括对快速致富计划、淫秽内容以及暴力或威胁性内容或活动的限制。

### 使用限制 

GitHub Pages 站点受到以下使用限制的约束：

- GitHub Pages 源存储库的建议限制为 1 GB。 有关详细信息，请参阅“[关于 GitHub 上的大文件](https://docs.github.com/zh/repositories/working-with-files/managing-large-files/about-large-files-on-github#file-and-repository-size-limitations)”
- 发布的 GitHub Pages 站点不得超过 1 GB。
- GitHub Pages 站点的软带宽限制为每月 100 GB。
- GitHub Pages 站点的软限制为每小时 10 次生成。 如果使用自定义 GitHub Actions 工作流生成和发布站点，则此限制不适用
- 为了为所有 GitHub Pages 站点提供一致的服务质量，可能会实施速率限制。 这些速率限制无意干扰 GitHub Pages 的合法使用。 如果你的请求触发了速率限制，你将收到相应响应，其中包含 HTTP 状态代码 `429` 以及信息性 HTML 正文。

如果您的站点超出这些使用配额，我们可能无法为您的站点提供服务；或者您可能收到来自 [GitHub 支持](https://support.github.com/contact?tags=docs-generic) 的礼貌电子邮件，建议降低站点对服务器影响的策略，包括将第三方内容分发网络 (CDN) 置于您的站点前，利用其他 GitHub 功能（如发行版）或转用可能更符合您需求的其他托管服务。

## GitHub Pages 上的 MIME 类型 

MIME 类型是服务器发送到浏览器的标头，提供有关浏览器所请求文件性质和格式的信息。 GitHub Pages 支持数千种文件扩展名中 750 多种 MIME 类型。 支持的 MIME 类型列表是从 [mime-db 项目](https://github.com/jshttp/mime-db)生成的。

虽然无法基于每个文件或每个仓库指定自定义 MIME 类型，但您可以添加或修改 MIME 类型以在 GitHub Pages 上使用。 有关详细信息，请参阅 [mime-db 贡献指南](https://github.com/jshttp/mime-db#adding-custom-media-types)。

## 数据收集 

访问 GitHub Pages 站点时，出于安全目的，无论访问者是否已登录 GitHub ，都会记录并存储访问者的 IP 地址。 有关 GitHub 的安全做法的详细信息，请参阅 [GitHub 隐私声明](https://docs.github.com/zh/site-policy/privacy-policies/github-privacy-statement)。