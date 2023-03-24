//
//  NowListViewController.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/20.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources

final class NowListViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let makeTodoList = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func bind(_ viewModel: NowListViewModel) {
        let dataSource = RxTableViewSectionedReloadDataSource<Task>(
            configureCell: { _, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: NowListCellView.identifier,
                    for: indexPath
                ) as? NowListCellView
                cell?.setData(item)
                return cell ?? UITableViewCell()
            })
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].header
        }
        
        viewModel.datas.asDriver()
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        viewModel.pushTodoPlusView
            .drive(onNext: { viewModel in
                let viewController = TodoPlusViewController()
                viewController.bind(viewModel)
                self.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: disposeBag)
        
        // 위치 수정 필요??
        Observable.zip(tableView.rx.modelSelected(TodoList.self), tableView.rx.itemSelected)
            .bind { [weak self] (task, indexPath) in
                let viewController = TodoPlusViewController()
                let viewModel = TodoPlusViewModel()
                viewController.todo = task
                viewController.indexpath = indexPath
                viewController.bind(viewModel)
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
            .disposed(by: disposeBag)
        
        makeTodoList.rx.tap
            .bind(to: viewModel.makeTodoListButtonTapped)
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "작업"
        
        view.backgroundColor  = .systemGray6

        makeTodoList.image = UIImage(systemName: "plus.circle")
        makeTodoList.style = .done
        
        navigationItem.setRightBarButton(makeTodoList, animated: true)
        
        tableView.backgroundColor = .clear
        
        tableView.register(NowListCellView.self, forCellReuseIdentifier: NowListCellView.identifier)
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
