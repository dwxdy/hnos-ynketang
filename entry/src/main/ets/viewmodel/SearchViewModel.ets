
/**
 * Search view model.
 */
class SearchViewModel {
  /**
   * Get search arr data.
   */
  getSearchArrData() {
    let listItems: Array<string> = [
      'Text', 'Button', 'TextField', 'Image',
      'Switch', 'Checkbox', 'RadioButton',
      'ProgressBar', 'ScrollView'
    ];
    return listItems;
  }//最近搜索
}

export default new SearchViewModel();