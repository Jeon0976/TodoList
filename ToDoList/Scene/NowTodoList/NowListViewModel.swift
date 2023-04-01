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
    
//    let todoChange: BehaviorRelay<Void>
//    let checkTodo: Driver<TodoList>
    
    // ViewModel -> TodoPlusViewMdeol
//    let pushEditTodoList: Driver<TodoPlusViewModel>
    
    // View -> ViewModel
    let makeTodoListButtonTapped = PublishRelay<Void>()
    let todoSelected = PublishRelay<TodoList>()

    
    init() {
        let todoPlusViewModel = TodoPlusViewModel()

        
    
        datas = BehaviorRelay<[Task]>(value: mockData)
        
        self.pushTodoPlusView = makeTodoListButtonTapped
            .map { return todoPlusViewModel }
            .asDriver(onErrorDriveWith: .empty())
  
        todoSelected.subscribe { todo in
            mockRoutineTodo[0] = todo
            print(mockRoutineTodo)
        }.disposed(by: disposBag)
        
//        self.todoChange = todoSelected
//            .subscribe(onNext: { todo in
//                mockRoutineTodo[0] = todo
//                print(mockRoutineTodo)
//            })
//            .disposed(by: disposBag)
        
//        self.todoChange = todoSelected
//            .bind { todo in
//
//                mockRoutineTodo[0] = todo
//                print(todo)
//            }
//
//        self.pushEditTodoList = todoSelected
//            .map({ IndexPath in
//                <#code#>
//            })
        
//        self.checkTodo = todoSelected
//            .asDriver(onErrorDriveWith: .empty())
//            .map({ indexPath in
//                var todo: TodoList?
//
//
//
//                return todo
//            })
//
//            .map { indexPath in
//                var task = Task?
//                task = mockData[indexPath]
//
//                return task
//            }
//            .asDriver(onErrorDriveWith: .empty())
        
    }
    
    func change(_ todo: TodoList) {
        mockRoutineTodo[0] = todo
        print(todo)
        print(mockRoutineTodo[0])
    }
    
}
