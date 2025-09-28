1.项目结构
main
├─entryability
│ ├─EntryAbility.ets // 应用入口
│ └─EntryBackupAbility.ets // 备份恢复入口（默认生成）
└─pages
├─Index.ets // 首页导航
├─Demo1.ets // 显性动画练习
├─Page1.ets // 隐性动画练习
├─Page2.ets // .animation 属性综合练习
├─KeyframeAnimationPage.ets // 帧动画（Keyframe）演示
├─ProductList.ets // 商品列表（带动画）
├─ProductDetail.ets // 商品详情（带动画）
└─SlideTipCard.ets // 侧滑提示卡片（手势+动画）
2.动画知识点速览
| 分类         | 文件/入口                     | 关键类/属性              | 效果描述                            |
| ---------- | ------------------------- | ------------------- | ------------------------------- |
| 显性动画       | Demo1.ets                 | animateTo、animation | 按钮点击后显式触发缩放+透明度变化               |
| 隐性动画       | Page1.ets                 | state + 直接修改属性      | 通过状态变量驱动，自动补间，无需手动调用动画          |
| .animation | Page2.ets                 | .animation() 链式     | 对单个组件声明式添加动画，支持曲线、延时等配置         |
| 帧动画        | KeyframeAnimationPage.ets | KeyframeAnimate     | 多关键帧实现波浪跳动、旋转等复杂组合动画            |
| 综合场景       | ProductList.ets           | List + 动画           | 列表项插入/删除带动画，联动 ProductDetail 转场 |
| 手势动画       | SlideTipCard.ets          | PanGesture + 动画     | 左滑出现「删除」按钮，松手回弹或执行删除动画          |
3. 如何运行
安装 DevEco Studio 4.0+。
克隆本仓库（或本地解压）。
打开项目根目录，等待依赖同步完成。
连接真机或启动本地模拟器（API 12+）。
点击 ▶️ Run，首页即可看到导航列表，按需进入各动画示例。
4. 快速体验
| 动图                                | 描述                          |
| --------------------------------- | --------------------------- |
| ![显性动画](./docs/demo1.gif)         | Demo1：点击按钮触发缩放              |
| ![帧动画](./docs/keyframe.gif)       | KeyframeAnimationPage：帧动画组合 |
| ![SlideTipCard](./docs/slide.gif) | SlideTipCard：侧滑删除           |
