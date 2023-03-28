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
    
    
}
