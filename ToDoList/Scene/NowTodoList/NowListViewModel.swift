//
//  NowListViewModel.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/20.
//
import UIKit

import RxSwift
import RxCocoa

struct NowListViewModel {
    let disposBag = DisposeBag()
    
    let nowListCellModel = NowListCellModel()
    
    // ViewModel -> View
    let datas: BehaviorRelay<[Task]>
    let pushTodoPlusView: Driver<TodoPlusViewModel>
    let checkTodo: Driver<TodoList>
    
    // ViewModel -> TodoPlusViewMdeol
//    let pushEditTodoList: Driver<TodoPlusViewModel>
    
    // View -> ViewModel
    let makeTodoListButtonTapped = PublishRelay<Void>()
    let todoSelected = PublishRelay<IndexPath>()
    
    init() {
        let todoPlusViewModel = TodoPlusViewModel()
        let mockData: [Task] = [
            Task(header: "🔁 반복 작업", items: [
                TodoList(todo: "Test", date: "test", isDone: false),
                TodoList(todo: "Test2", date: "test", isDone: false)
            ]),
            Task(header: "▶️ 단기 작업", items: [
                TodoList(todo: "Test", date: "test", isDone: false),
                TodoList(todo: "Test2", date: "test", isDone: false)
            ])
        ]
        datas = BehaviorRelay<[Task]>(value: mockData)
        
        self.pushTodoPlusView = makeTodoListButtonTapped
            .map { return todoPlusViewModel }
            .asDriver(onErrorDriveWith: .empty())
        

//        self.pushEditTodoList = todoSelected
//            .map({ IndexPath in
//                <#code#>
//            })
        
        self.checkTodo = todoSelected
            .asDriver(onErrorDriveWith: .empty())
            .map({ indexPath in
                var todo: TodoList?

                
                
                return todo
            })
            
//            .map { indexPath in
//                var task = Task?
//                task = mockData[indexPath]
//
//                return task
//            }
//            .asDriver(onErrorDriveWith: .empty())

        
        
    }
}
