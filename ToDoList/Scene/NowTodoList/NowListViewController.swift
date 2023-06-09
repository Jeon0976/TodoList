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
        
        dataSource.canEditRowAtIndexPath = { _, _ in
            return true
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
//
//        tableView.rx.itemDeleted
//            .withUnretained(self)
//            .bind { section, indexPath in
//
//
//            }
//        tableView.rx.itemSelected
//            .asObservable()
//            .bind(onNext: { indexPath in
//                viewModel.todoSelected
//            })
//            .disposed(by: disposeBag)
        
//        Observable.zip(tableView.rx.modelSelected(TodoList.self), tableView.rx.itemSelected)
//            .bind { [weak self] (task, indexPath) in
//                var task = task
////                let viewController = TodoPlusViewController()
////                let viewModel = TodoPlusViewModel()
//                task.isDone = true
////                viewController.todo = task
////                viewController.indexpath = indexPath
////                viewController.bind(viewModel)
////                self?.navigationController?.pushViewController(viewController, animated: true)
//                    // task 데이터를 mockData가 변경될 수 있도록 변경
//
//            }
//            .disposed(by: disposeBag)
        
//        viewModel.todoChange
//            .drive { _ in
//                tableView.reloadData()
//            }
        
        
        tableView.rx.modelSelected(TodoList.self)
            .map { todo in
                print(todo)
                var todo = todo
                if todo.isDone == false {
                    todo.isDone = true
                } else {
                    todo.isDone = false
                }
                print(todo)

                return todo
                
            }
            .bind(to: viewModel.todoSelected)
            .disposed(by: disposeBag)
        
        
        
        makeTodoList.rx.tap
            .bind(to: viewModel.makeTodoListButtonTapped)
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    private func attribute() {
        view.backgroundColor  = .systemGray6
        navigationItem.title = "작업"
        
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
