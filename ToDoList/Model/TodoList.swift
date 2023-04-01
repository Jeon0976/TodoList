//
//  TodoList.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/22.
//

import Foundation

struct TodoList {
    var todo: String
    var date: String
    var isDone: Bool
    
}

var mockRoutineTodo: [TodoList] = [
    TodoList(todo: "Test1", date: "test", isDone: false),
    TodoList(todo: "Test2", date: "test", isDone: false)
]

var mockDayTodo: [TodoList] = [
    TodoList(todo: "테스트1", date: "테스트", isDone: true),
    TodoList(todo: "테스트2", date: "테스트", isDone: true)
]
