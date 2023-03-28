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
    let pushLongtermPlusView: Driver<LongtermPlusViewModel>
    
    // View -> ViewModel
    let makeLongtermButtonTapped = PublishRelay<Void>()
    
    init() {
        let longtermPlusViewmodel = LongtermPlusViewModel()
        
        let testData = BehaviorRelay<[Longterm]>(value: [
            Longterm(projectName: "Test Project1", term: "2033-33-33~2033-22-33"),
            Longterm(projectName: "Test Porject2", term: "2022-22-22~2032-22-44")
        ])
        
        self.cellData = testData
            .asDriver()
        
        self.pushLongtermPlusView = makeLongtermButtonTapped
            .map { return longtermPlusViewmodel }
            .asDriver(onErrorDriveWith: .empty())
    }
}
