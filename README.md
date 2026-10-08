# 相逢

Windows 取色助手的单文件发布与自动更新仓库。

[下载最新正式版](https://github.com/Found-L/xiangfeng-updates/releases/latest/download/xiangfeng.exe) · [版本记录](https://github.com/Found-L/xiangfeng-updates/releases)

支持 Windows 10/11 x64，使用前安装 [.NET 8 Desktop Runtime x64](https://dotnet.microsoft.com/zh-cn/download/dotnet/8.0)。只需下载一个 EXE；可按需要将 `xiangfeng.exe` 改名为 `相逢.exe`。

启动后自动检查并下载新版。在停止宏、取色及编辑并切回相逢窗口后，倒计时重启升级。个人配置和取色保留；旧程序留下备份。断网、下载损坏或新版启动检查失败时继续使用原版本。「更多功能」中可以手动检查更新或调整更新设置。

第一次使用没有更新功能的旧版本，先下载 0.15.2 或更新版本，之后由客户端自动获取兼容更新。目标电脑首次使用时须重新取色。

此仓库用于公开版本资产、更新协议及发布工具，不包含用户配置、个人取色、日志或登录凭据。应用源码和本机完整验证材料保留在开发工作区。

## 发布新版

1. 在开发工作区修改程序集版本，构建并完成离线回归、界面检查及更新助手验证。
2. 运行 `tools/New-UpdateManifest.ps1 -Executable <已验证的EXE路径>`，生成 `xiangfeng.exe` 和 `update.json`。
3. 创建同版本标签，例如 `v0.15.3`，在正式 Release 中上传这两个文件。发布为最新正式版本，避免将测试版设为 latest。
4. 检查固定更新入口和 EXE 下载，确认版本、长度、SHA-256 与发布文件一致。

固定入口：[update.json](https://github.com/Found-L/xiangfeng-updates/releases/latest/download/update.json)。协议详见 [更新协议](docs/update-protocol.md)。

仓库说明或发布工具的改动采用 issue → branch → PR → review → merge 流程。本仓库未设置构建工作流，以上流程说明不代表 GitHub 已强制分支保护或审核要求。
