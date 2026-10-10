# 相逢

Windows 取色助手的单文件发布与自动更新仓库。

[下载最新正式版](https://github.com/Found-L/xiangfeng-updates/releases/latest) · [版本记录](https://github.com/Found-L/xiangfeng-updates/releases)

支持 Windows 10/11 x64，使用前安装 [.NET 8 Desktop Runtime x64](https://dotnet.microsoft.com/zh-cn/download/dotnet/8.0)。下载一个中文名加版本号的 EXE，例如 `相逢-v0.17.49.exe`，即可分享和运行。`xiangfeng.exe` 保留为相同程序的兼容副本，供已有固定下载链接使用。

版本号表示该下载包的版本。当前客户端自动更新会原地替换并沿用原文件名，升级后的实际版本以软件内显示为准。

启动后自动检查并下载新版。在停止宏、取色及编辑并切回相逢窗口后，倒计时重启升级。个人配置和取色保留；旧程序留下备份。断网、下载损坏或新版启动检查失败时继续使用原版本。「更多功能」中可以手动检查更新或调整更新设置。

第一次使用没有更新功能的旧版本，先下载 0.15.2 或更新版本，之后由客户端自动获取兼容更新。目标电脑首次使用时须重新取色。

此仓库用于公开版本资产、更新协议及发布工具，不包含用户配置、个人取色、日志或登录凭据。应用源码和本机完整验证材料保留在开发工作区。

## 发布新版

1. 在开发工作区修改程序集版本，构建并完成离线回归、界面检查及更新助手验证。
2. 运行 `tools/New-UpdateManifest.ps1 -Executable <已验证的EXE路径>`，生成 `相逢-v<版本>.exe`、固定链接兼容副本 `xiangfeng.exe` 和 `update.json`。更新清单指向中文版本文件，URL 中的中文按 UTF-8 百分号编码。
3. 创建同版本标签，例如 `v0.17.49`，在正式 Release 中上传这三个文件。发布为最新正式版本，避免将测试版设为 latest。用户只需下载一个 EXE。
4. 检查固定更新入口和 EXE 下载，确认版本、长度、SHA-256 与发布文件一致。

固定入口：[update.json](https://github.com/Found-L/xiangfeng-updates/releases/latest/download/update.json)。协议详见 [更新协议](docs/update-protocol.md)。

仓库说明或发布工具的改动采用 issue → branch → PR → review → merge 流程。本仓库未设置构建工作流，以上流程说明不代表 GitHub 已强制分支保护或审核要求。
