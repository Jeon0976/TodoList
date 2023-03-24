//
//  CalenderViewController.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/20.
//

import UIKit

import RxSwift
import RxCocoa

final class CalenderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func bind(_ viewModel: CalenderViewModel) {

    }
    
    private func attribute() {
        view.backgroundColor = .systemGray6
        navigationItem.title = "달력"
    }
    
    private func layout() {
        
    }
}
