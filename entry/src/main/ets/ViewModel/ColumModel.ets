export  class ColumModel{

  totalTask : number = 0
  finishTask: number = 0

  constructor(totalTask:number,finishTask:number) {
    this.totalTask = totalTask
    this.finishTask = finishTask
  }

}

export  class Taks {
  name:string = '目标'
  finished:boolean = false

  // constructor(name:string,finished:boolean) {
  //   this.name = name
  //   this.finished = finished
  // }

}

export type testArray = {
  type:number
  name:number
}