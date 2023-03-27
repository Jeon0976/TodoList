//
//  LongtermViewModel.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/23.
//

import RxSwift
import RxCocoa

struct LongtermViewModel {
    let longtermCellModel = LongtermCellModel()
    
    // ViewModel -> View
    let cellData: Driver<[Longterm]>
    
    // View -> ViewModel
    
    init() {
        let testData = BehaviorRelay<[Longterm]>(value: [
            Longterm(projectName: "Test Project1", term: "2033-33-33~2033-22-33"),
            Longterm(projectName: "Test Porject2", term: "2022-22-22~2032-22-44")
        ])
        
        self.cellData = testData
            .asDriver()
    }
}
