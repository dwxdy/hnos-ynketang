
import Constants from '../../common/components/Constants';
import CourseModel from '../../common/bean/CourseModel';
import Router from '@system.router';

@Entry
@Component
export default struct VideoCreateComponent {
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true

  // @Prop itemStr: string;
  controller: VideoController = new VideoController()
  // item: CourseModel;
  //
  // aboutToAppear() {
  //   this.item = JSON.parse(this.itemStr);
  // }

  build() {
    Column() {
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller
      }).width('100%').height(400)
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .onStart(() => {
          console.info('onStart')
        })
        .onPause(() => {
          console.info('onPause')
        })
        .onFinish(() => {
          console.info('onFinish')
        })
        .onError(() => {
          console.info('onError')
        })
        .onPrepared((e) => {
          console.info('onPrepared is ' + e.duration)
        })
        .onSeeking((e) => {
          console.info('onSeeking is ' + e.time)
        })
        .onSeeked((e) => {
          console.info('onSeeked is ' + e.time)
        })
        .onUpdate((e) => {
          console.info('onUpdate is ' + e.time)
        })

      Row() {
        Button('src').onClick(() => {
          this.videoSrc = $rawfile('video2.mp4') // 切换视频源
        }).margin(5)
        Button('previewUri').onClick(() => {
          this.previewUri = $r('app.media.icon') // 切换视频预览海报
        }).margin(5)
        Button('controls').onClick(() => {
          this.showControls = !this.showControls // 切换是否显示视频控制栏
        }).margin(5)
      }

      Row() {
        Button('start').onClick(() => {
          this.controller.start() // 开始播放
        }).margin(5)
        Button('pause').onClick(() => {
          this.controller.pause() // 暂停播放
        }).margin(5)
        Button('stop').onClick(() => {
          this.controller.stop() // 结束播放
        }).margin(5)
        Button('setTime').onClick(() => {
          this.controller.setCurrentTime(10, SeekMode.Accurate) // 精准跳转到视频的10s位置
        }).margin(5)
      }

      Row() {
        Button('rate 0.75').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_0_75_X // 0.75倍速播放
        }).margin(5)
        Button('rate 1').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_1_00_X // 原倍速播放
        }).margin(5)
        Button('rate 2').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_2_00_X // 2倍速播放
        }).margin(5)
      }

      // Text(this.item.courseName)
      //   .fontSize($r('app.float.normal_font_size'))
      //   .fontColor($r('app.color.base_font_color'))
      //   .fontFamily($r('app.string.hei_ti_medium'))
      //   .maxLines(Constants.TITLE_LINE_NUMBER)
      //   .textOverflow({ overflow: TextOverflow.Clip })
      //   .lineHeight($r('app.float.title_line_height'))
      //   .width(Constants.FULL_PERCENT)

    }
  }
}