//
//  LongtermViewController.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/23.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class LongtermViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let makeLongtermTodo = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func bind(_ viewModel: LongtermViewModel) {
        viewModel.cellData
            .drive(tableView.rx.items) { tableView, row, data in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LongtermCellView.identifier,
                    for: IndexPath(row: row, section: 0)
                ) as? LongtermCellView
                cell?.bind(viewModel.longtermCellModel)
                cell?.setData(data)
                return cell ?? UITableViewCell()
            }
            .disposed(by: disposeBag)
        
    }
    
    private func attribute() {
        view.backgroundColor = .systemGray6
        navigationItem.title = "프로젝트"
        
        makeLongtermTodo.image = UIImage(systemName: "plus.circle")
        makeLongtermTodo.style = .done
        
        navigationItem.setRightBarButton(makeLongtermTodo, animated: true)
        
        tableView.backgroundColor = .clear
        tableView.register(LongtermCellView.self, forCellReuseIdentifier: LongtermCellView.identifier)
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
