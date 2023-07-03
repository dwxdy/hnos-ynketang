import router from '@ohos.router'
import Const from '../../common/constants/CommonConstants'

@Entry
@Component

struct home {
  @State index: number = 0
  private swiperController: SwiperController = new SwiperController()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State currentIndex: number = 0
  @State Build: Array<Object> = [
    {
      text: 'add',
      num: 0
    },
    {
      text: 'app',
      num: 1
    },
    {
      text: 'collect',
      num: 2
    }
  ]

  @Builder NavigationTitle() {
    Column() {
      Text('Title')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text('subtitle')
        .fontColor('#182431')
        .fontSize(14)
        .lineHeight(19)
        .opacity(0.4)
        .margin({ top: 2, bottom: 20 })
    }.alignItems(HorizontalAlign.Start)
  }

  @Builder NavigationMenus() {

  }

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.Build, item => {
        Column() {
          Image(this.currentIndex == item.num ? $r("app.media.brightness") : $r("app.media.brightness"))
            .width(24)
            .height(24)
          Text(item.text)
            .fontColor(this.currentIndex == item.num ? '#007DFF' : '#182431')
            .fontSize(10)
            .lineHeight(14)
            .fontWeight(500)
            .margin({ top: 3 })
        }.width(104).height(56)
        .onClick(() => {
          this.currentIndex = item.num
        })
      })
    }.margin({ left: 24 })
  }

  build() {
    Column({ space: 5 }) {

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Row(){
          TextInput({ placeholder: 'search...' })
            .width('80%')
            .height(40)
            .backgroundColor('#FFFFFF')
            .margin({ right: 8 })

          Image($r("app.media.public"))
            .width(20)
            .height(24)
            .margin({ left: 24})

        }


        Swiper(this.swiperController) {
          Image($r("app.media.icon"))
            .width(Const.FULL_WIDTH)
            .height(160)
            .onClick(() => {
              router.pushUrl({ url: 'pages/1' })
            })

          Image($r("app.media.OIP"))
            .width(Const.FULL_WIDTH)
            .height(160)
            .onClick(() => {
              router.pushUrl({ url: 'pages/2' })
            })

          Image($r("app.media.pexels"))
            .width(Const.FULL_WIDTH)
            .height(160)
            .onClick(() => {
              router.pushUrl({ url: 'pages/3' })
            })
        }
        .cachedCount(2)
        .index(1)
        .autoPlay(true)
        .interval(4000)
        .indicator(true)
        .loop(true)
        .duration(1000)
        .itemSpace(0)
        .curve(Curve.Linear)
        .onChange((index: number) => {
          console.info(index.toString())
        })

        Navigation() {
          List({ space: 12, initialIndex: 0 }) {
            ForEach(this.arr, (item) => {
              ListItem() {
                Text('' + item)
                  .width('90%')
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
              }.editable(true)
            }, item => item)
          }
          .height(324)
          .width('100%')
          .margin({ top: 12, left: '10%' })
        }
        //.title(this.NavigationTitle)
        //.menus(this.NavigationMenus)
        .titleMode(NavigationTitleMode.Full)
        .toolBar(this.NavigationToolbar)
        .hideTitleBar(false)
        .hideToolBar(false)
        .onTitleModeChange((titleModel: NavigationTitleMode) => {
          console.info('titleMode' + titleModel)
        })
      }.width('100%').height('100%').backgroundColor('#F1F3F5')
    }

  }
}