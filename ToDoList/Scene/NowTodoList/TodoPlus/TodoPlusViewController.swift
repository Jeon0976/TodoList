//
//  TodoPlusViewController.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/23.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class TodoPlusViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let setRoutine = UISwitch()
    let todoTitle = UITextField()
    let calIcon = UIImageView()
    let routineTodoIcon = UIImageView()
    let todoDate = UITextField()
    let descriptionIcon = UIImageView()
    let descriptionTodo = UITextView()
    let checkTodo = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func bind(_ viewModel: TodoPlusViewModel) {
        descriptionTodo.rx.didBeginEditing
            .bind { [weak self] _ in
                if self?.descriptionTodo.textColor == .lightGray {
                    self?.descriptionTodo.text = ""
                    self?.descriptionTodo.textColor = .label
                }
            }
            .disposed(by: disposeBag)
        
        setRoutine.rx.isOn
            .bind { [weak self] _ in
                if self?.todoDate.isHidden == false {
                    self?.todoDate.isHidden = true
                    self?.routineTodoIcon.isHidden = false
                } else {
                    self?.todoDate.isHidden = false
                    self?.routineTodoIcon.isHidden = true
                }
            }
            .disposed(by: disposeBag)
        
        todoTitle.rx.text
            .bind { [weak self] text in
                if text == "" {
                    self?.checkTodo.isEnabled = false
                } else {
                    self?.checkTodo.isEnabled = true
                }
            }
            .disposed(by: disposeBag)

    }
    
    private func attribute() {
        view.backgroundColor = .systemGray6
        navigationItem.title = "작업 추가"
        
        // checkTodo
        checkTodo.image = UIImage(systemName: "paperplane")
        checkTodo.style = .done
        checkTodo.isEnabled = false
        navigationItem.rightBarButtonItem = checkTodo
        
        // todoTitle
        todoTitle.placeholder = "TestTitle"
        todoTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        // setRoutine
        
        // calIcon
        calIcon.image = UIImage(systemName: "calendar")
        
        // routineTodoIcon
        routineTodoIcon.image = UIImage(systemName: "repeat")
        routineTodoIcon.isHidden = true
        
        // todayTodo
        todoDate.text = "2023-03-24"
        todoDate.isHidden = false
        
        // descriptionIcon
        descriptionIcon.image = UIImage(systemName: "newspaper")
        
        // descriptionTodo
        descriptionTodo.text = "TestDescription"
        descriptionTodo.textColor = .lightGray
        descriptionTodo.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        descriptionTodo.backgroundColor = .systemGray6
    }
    
    private func layout() {
        
        [todoTitle,
         setRoutine,
         calIcon,
         routineTodoIcon,
         todoDate,
         descriptionIcon,
         descriptionTodo
        ].forEach { view.addSubview($0) }
                        
        todoTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        setRoutine.snp.makeConstraints {
            $0.top.equalTo(todoTitle.snp.bottom).offset(32)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(todoDate.snp.trailing).offset(16)
        }

        calIcon.snp.makeConstraints {
            $0.top.equalTo(todoTitle.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(16)
        }

        routineTodoIcon.snp.makeConstraints {
            $0.top.equalTo(todoTitle.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }

        todoDate.snp.makeConstraints {
            $0.top.equalTo(todoTitle.snp.bottom).offset(32)
            $0.leading.equalTo(calIcon.snp.trailing).offset(16)
        }

        descriptionIcon.snp.makeConstraints {
            $0.top.equalTo(todoDate.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(16)
        }
        
        descriptionTodo.snp.makeConstraints {
            $0.top.equalTo(todoDate.snp.bottom).offset(32)
            $0.leading.equalTo(descriptionIcon.snp.trailing).offset(16)
            $0.width.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.height.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}
