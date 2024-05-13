@Component
export default struct ToDoItem {
  private content: string;
  private contentIndex: number;
  deleteItem: Function;
  @State isComplete: boolean = false;

  @Builder labelIcon(icon: Resource) {
    Image(icon)
      .onClick(() => {
        this.isComplete = !this.isComplete;
      })
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    Row() {
      Row() {
        if (this.isComplete) {
          this.labelIcon($r('app.media.ic_ok'));
        } else {
          this.labelIcon($r('app.media.ic_default'));
        }

        Text(this.content)
          .fontSize(18)
          .fontWeight(500)
          .opacity(this.isComplete ? 0.5 : 1)
          .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
      }
      Text('删除')
        .fontColor('red')
        .margin(20)
        .onClick(() => {
          this.deleteItem(this.contentIndex)
        })
    }
    .borderRadius(10)
    .backgroundColor('white')
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .margin({top: 10})
    // .onClick(() => {
    //   this.isComplete = !this.isComplete;
    // })
  }
}