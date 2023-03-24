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
    let nowListCellModel = NowListCellModel()
    
    // ViewModel -> View
    let datas: BehaviorRelay<[Task]>
    let pushTodoPlusView: Driver<TodoPlusViewModel>
    
    // ViewModel -> TodoPlusViewMdeol
//    let pushEditTodoList: Driver<TodoPlusViewModel>
    
    // View -> ViewModel
    let makeTodoListButtonTapped = PublishRelay<Void>()
    let todoSelected = PublishRelay<IndexPath>()
    
    init() {
        let todoPlusViewModel = TodoPlusViewModel()
        
        datas = BehaviorRelay<[Task]>(value: [
            Task(header: "섹션 테스트 1", items: [
                TodoList(todo: "Test", date: "test", isDone: false),
                TodoList(todo: "Test2", date: "test", isDone: false)
            ]),
            Task(header: "섹션 테스트 2", items: [
                TodoList(todo: "Test", date: "test", isDone: false),
                TodoList(todo: "Test2", date: "test", isDone: false)
            ])
        ])
        
        self.pushTodoPlusView = makeTodoListButtonTapped
            .map { return todoPlusViewModel }
            .asDriver(onErrorDriveWith: .empty())
        
//        self.pushEditTodoList = todoSelected
//            .map({ IndexPath in
//                <#code#>
//            })
    }
}
