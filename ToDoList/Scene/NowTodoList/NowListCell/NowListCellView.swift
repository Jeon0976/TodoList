//
//  NowListCellView .swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/21.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class NowListCellView: UITableViewCell {
    static let identifier = "NowListCellView"
    
    let disposeBag = DisposeBag()
    
    let todoText = UILabel()
    let todoRoutine = UILabel()
    let todoCheck = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: NowListCellModel) {
        
    }
    
    func setData(_ todo: TodoList) {
        switch todo.isDone {
        case true:
            todoCheck.image = UIImage(systemName: "checkmark.circle.fill")
            todoText.text = todo.todo
            todoRoutine.text = todo.date
        case false:
            todoCheck.image = UIImage(systemName: "circle")
            todoText.text = todo.todo
            todoRoutine.text = todo.date
        }
    }
    
    private func attribute() {
        selectionStyle = .none
        backgroundColor = .systemBackground
        
        todoText.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        todoRoutine.font = UIFont.systemFont(ofSize: 10, weight: .light)
    }
    
    private func layout() {
//        contentView.layer.cornerRadius = 10
        
        [todoText, todoCheck, todoRoutine].forEach {
            contentView.addSubview($0)
        }
        
        todoCheck.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.bottom.equalToSuperview().inset(16.0)
        }
        
        todoText.snp.makeConstraints {
            $0.leading.equalTo(todoCheck.snp.trailing).offset(16.0)
            $0.top.equalToSuperview().inset(8.0)
        }
        
        todoRoutine.snp.makeConstraints {
            $0.leading.equalTo(todoCheck.snp.trailing).offset(16.0)
            $0.top.equalTo(todoText.snp.bottom)
            $0.bottom.equalToSuperview().inset(8.0)
        }
    }
}
