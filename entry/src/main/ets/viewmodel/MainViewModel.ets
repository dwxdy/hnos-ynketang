/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ItemData from '../../common/bean/ItemData';

/**
 * Binds data to components and provides interfaces.
 */
export class MainViewModel {

  /**
   * Get swiper image data.
   *
   * @return {Array<Resource>} swiperImages.
   */
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.run1'),
      $r('app.media.run2'),
      $r('app.media.run3'),
      $r('app.media.run4')
    ]; //轮播图

    return swiperImages;
  }

  /**
   * Get data of the first grid.
   *
   * @return {Array<PageResource>} firstGridData.
   */
  getFirstGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData($r('app.string.my_love'), $r('app.media.love')),
      new ItemData($r('app.string.history_record'), $r('app.media.record')),
      new ItemData($r('app.string.message'), $r('app.media.message')),
      new ItemData($r('app.string.shopping_cart'), $r('app.media.shopping')),
      new ItemData($r('app.string.my_goal'), $r('app.media.target')),
      new ItemData($r('app.string.group'), $r('app.media.circle')),
      new ItemData($r('app.string.favorites'), $r('app.media.favorite')),
      new ItemData($r('app.string.recycle_bin'), $r('app.media.recycle'))
    ]; //2*4界面


    return firstGridData;
  }


  /**
   * Get data of the second grid.
   *
   * @return {Array<PageResource>} secondGridData.
   */
  getSecondGridData(): Array<ItemData> {
    let secondGridData: ItemData[] = [
      new ItemData($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top')),
      new ItemData($r('app.string.mainPage_new'), $r('app.media.new'), $r('app.string.mainPage_text_new')),
      new ItemData($r('app.string.mainPage_brand'), $r('app.media.brand'), $r('app.string.mainPage_text_brand')),
      new ItemData($r('app.string.mainPage_found'), $r('app.media.found'), $r('app.string.mainPage_text_found'))
    ];//列表图


    return secondGridData;
  }


  /**
   * Get data of the setting list.
   *
   * @return {Array<PageResource>} settingListData.
   */
  getSettingListData(): Array<ItemData> {
    let settingListData: ItemData[] = [
      new ItemData($r('app.string.setting_list_news'), $r("app.media.news"), $r("app.string.setting_toggle")),
      new ItemData($r('app.string.setting_list_data'), $r("app.media.data"), null),
      new ItemData($r('app.string.setting_list_menu'), $r("app.media.menu"), null),
      new ItemData($r('app.string.setting_list_about'), $r("app.media.about"), null),
      new ItemData($r('app.string.setting_list_storage'), $r("app.media.storage"), null),
      new ItemData($r('app.string.setting_list_privacy'), $r("app.media.privacy"), null)
    ];//个人界面栏位图


    return settingListData;
  }
}

export default new MainViewModel();