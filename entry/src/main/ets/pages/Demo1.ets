@Entry
@Component
struct Demo1 {
  @State isMoved: boolean = false;
  @State btnWidth: number = 120;
  @State color: string = '#875975'
  @State rotateAngle: number = 0

  @State scalee: number = 1;
  private timer: number = -1;

  onPageShow(): void {
    // 7. 定时器与状态切换：每 1.2s 一次心跳
    this.timer = setInterval(() => {
      this.scalee = this.scalee === 1 ? 1.3 : 1; // 放大/收缩交替
    }, 1200);
  }

  onPageHide(): void {
    clearInterval(this.timer);
  }

  build() {
    Column({space: 16}){
      Text('显示动画演示')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Button('改变位置').onClick(() => {
        this.isMoved = !this.isMoved
      })


        Circle({ width: 60, height: 60 })
          .fill(this.isMoved ? '#ff4caf50' : '#ffa883c4')
          .translate({x:this.isMoved ? 200 : 0,y: 0})
          .animation({
            duration: 1000,
            curve: Curve.Smooth
          })

        Rect({ width: 60, height: 60 })
          .fill(this.isMoved ? '#ff4c65af' : '#ffca2424')
          .translate({x:this.isMoved ? 100 : 0,y: 0})
          .animation({
            duration: 1000,
            curve: Curve.Smooth
          })

      Button('点击改变文字大小和背景色')
        .width(this.btnWidth)
        .height(60)
        .backgroundColor(this.color)
        .onClick(() => {
          this.btnWidth = this.btnWidth === 120 ? 200 : 120
          this.color = this.color === '#875975' ? '#477396' : '#875975'
      })
        .animation({
          duration: 600,
          curve: Curve.EaseInOut,
          iterations: 3,
          playMode: PlayMode.Normal
        })

      Button('角度变化')
        .onClick(() => {
          this.rotateAngle = 90
        })
        .margin(50)
        .rotate({angle: this.rotateAngle})
        .animation({
          duration: 1200,
          curve: Curve.Friction,
          delay: 500,
          iterations: -1,
          playMode: PlayMode.Alternate,
          expectedFrameRateRange: {
            min: 20,
            max: 120,
            expected: 90
          }
        })
      Image($r('app.media.aixin'))
        .width(120)
        .height(120)
        .scale({ x: this.scalee, y: this.scalee }) // 2. 状态绑定
        .animation({
          // 3. 新规范：.animation() 统一声明
          duration: 600, // 单次呼吸时长
          curve: Curve.Friction, // 4. 阻尼曲线，物理回弹感
          iterations: -1, // 5. 无限循环
          playMode: PlayMode.Alternate, // 5. 往返播放
          delay: 500, // 7. 延迟 500ms 启动，制造“蓄势”节奏
          expectedFrameRateRange: {
            min: 30,
            max: 60,
            expected: 60
          }
        })

    }
    .padding(16)
  }

}