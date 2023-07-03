
import Constants from '../../common/constants/CommonConstants';//0
import VClassifyModel from '../../common/bean/v-ClassifyModel';//0
import CourseModel from '../../common/bean/v-CourseModel';//0
import CourseItem from '../view/v-CourseItem';//0
import ClassifyItem from '../view/ClassityItem';//0
import VideoViewModel from '../viewmodel/v-ClassifyViewModel';//1

@Entry
@Component
export default struct VideoPage {
  @State currentClassify: number = 0; // selected classify index.
  @State requestSuccess: boolean = false; // is loading data.
  private classifyList: Array<VClassifyModel> = [];
  private classifyScroller: Scroller = new Scroller();
  private scroller: Scroller = new Scroller();

  aboutToAppear() {
    // loading data.
    setTimeout(() => {
      this.classifyList = VideoViewModel.getLinkData();
      this.requestSuccess = true;
    }, Constants.LOADING_DURATION);
  }

  @Builder ClassifyHeader(classifyName: string) {
    Row() {
      Text(classifyName)
        .fontSize($r('app.float.header_font_size'))
        .fontColor($r('app.color.base_font_color'))
        .fontFamily($r('app.string.hei_ti_medium'))
        .fontWeight(Constants.TITLE_FONT_WEIGHT)
    }
    .padding({ left: $r('app.float.item_padding_left') })
    .height($r('app.float.classify_item_height'))
    .width(Constants.FULL_PERCENT)
    .backgroundColor($r('app.color.base_background'))
  }

  classifyChangeAction(index: number, isClassify: boolean) {
    if (this.currentClassify !== index) {
      // change the classify status.
      this.currentClassify = index;
      if (isClassify) {
        // scroll the course scroll.
        this.scroller.scrollToIndex(index);
      } else {
        // scroll the classify scroll.
        this.classifyScroller.scrollToIndex(index);
      }
    }

  }

  build() {
    Row() {

      if (this.requestSuccess) {
        List({ scroller: this.scroller }) {
          ForEach(this.classifyList, (classifyItem: VClassifyModel) => {
            ListItemGroup({
              header: this.ClassifyHeader(classifyItem.classifyName),
              space: Constants.COURSE_ITEM_PADDING
            }) {
              ForEach(classifyItem.courseList, (courseItem: CourseModel) => {
                ListItem() {
                  CourseItem({ itemStr: JSON.stringify(courseItem) })
                }
              }, (courseItem: CourseModel) => `${courseItem.courseId}`)
            }
          }, (item: VClassifyModel) => `${item.classifyId}`)
        }
        .padding({ left: $r('app.float.item_padding_left'), right: $r('app.float.course_item_padding') })
        .sticky(StickyStyle.Header)
        .layoutWeight(1)
        .edgeEffect(EdgeEffect.None)
        .onScrollIndex((start: number) => this.classifyChangeAction(start, false))
      } else {
        Text($r('app.string.loading'))
          .fontFamily($r('app.string.hei_ti_medium'))
          .textAlign(TextAlign.Center)
          .height(Constants.FULL_PERCENT)
          .width(Constants.FULL_PERCENT)
      }
    }
    .backgroundColor($r('app.color.base_background'))
  }
}