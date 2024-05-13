import ToDoItem from '../view/ToDoItem';
import DataModel from '../viewmodel/DataModel';

@Entry
@Component
@Preview
struct Index {
  @State todoList: Array<String> = []
  @State text: string = ''
  controller: TextInputController = new TextInputController()

  aboutToAppear() {
    this.todoList = DataModel.getTodoData();
  }

  // 有 this 丢失的问题
  // deleteItem(index) {
  // console.log(JSON.stringify(this.message))
  // this.__todoList = this.__todoList.splice(index, 1)
  // console.log(this.todoList.length.toString())
  // }

  build() {
    Column({ space: 0 }) {
      Row(){
        Text('待办事项')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .justifyContent(FlexAlign.Start)
      .margin({top: 20})


      ForEach(this.todoList, (item: string, index: number) => {
        ToDoItem({ content: item, contentIndex: index, deleteItem: (index) => {
          this.todoList.splice(index, 1)
        } })
      }, (item: string) => JSON.stringify(item))

      Row() {
        TextInput({ text: this.text, placeholder: '添加待办事项', controller: this.controller })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 18, weight: 500 })
          .width('70%')
          .caretColor(Color.Blue)
          .fontSize(18)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value
          })
        Button('添加')
          .onClick(() => {
            if (!this.text) {
              return;
            }
            this.todoList.push(this.text);
            this.text = ''
            this.controller.caretPosition(1)
          })
      }
      .margin({top: 20})
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#EDF1F3')
    .padding(20)
  }
}