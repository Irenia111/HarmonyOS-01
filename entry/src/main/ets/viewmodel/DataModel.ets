export class DataModel {
  private tasks: Array<string> = [
    "早起晨练",
    "准备早餐",
    "阅读名著",
    "学习ArkTS",
    "看剧放松"
  ];

  getTodoData(): Array<string> {
    return this.tasks;
  }

  addTodoData(value: string): void{
    this.tasks.push(value)
  }
}

export default new DataModel();