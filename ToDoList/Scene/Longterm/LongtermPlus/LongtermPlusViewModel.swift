//
//  LongtermPlusViewModel.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/27.
//

import RxSwift
import RxCocoa

struct LongtermPlusViewModel {
    let longtermPlusCellModel = LongtermPlusCellModel()
    
    // ViewModel -> View
    let cellData: Driver<[Detail]>
    // View -> ViewModel
    
    init() {
        let mockData = BehaviorRelay<[Detail]>(value: [
            Detail(num: "1. ", detailName: "테스트 하기"),
            Detail(num: "2. ", detailName: "테스트 확인하기")
        ])
        
        self.cellData = mockData
            .asDriver()
        
    }
}
