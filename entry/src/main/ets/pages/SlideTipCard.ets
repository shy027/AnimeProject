
@Entry
@Component
struct SlideTipCard {
  @State isExpanded: boolean = false;

  build() {
    Column() {
      // 顶部占位，让卡片能被推到“中间”
      Blank().layoutWeight(1)

      // 卡片容器
      Column() {
        // 标题行（永远可见）
        Row() {
          Text('今日待办')
            .fontSize(18)
            .fontColor('#FFF')
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(16)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#333')

        // 展开后才显示的任务列表
        if (this.isExpanded) {
          Column() {
            ForEach(['任务1：晨练30分钟', '任务2：阅读一章书', '任务3：喝水8杯'], (task: string) => {
              Text(task)
                .fontSize(14)
                .fontColor('#FFF')
                .width('100%')
                .padding({ left: 16, top: 8, bottom: 8 })
                .animation({
                  duration: 500,
                  curve: Curve.Smooth,
                  delay: 500
                })
            })
          }
          .padding({ bottom: 16 })
        }
      }
      .width('90%')
      .backgroundColor('#ff9d9d9d')
      .borderRadius(12)
      .translate({  y: this.isExpanded ? -360 : 0 })
      .animation({
        duration: 800,
        curve: Curve.EaseInOut // 4. 缓动函数
      })
      .onClick(() => {
        // 5. 点击切换状态 → 动画自动触发
        this.isExpanded = !this.isExpanded;
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F1F1')
  }
}