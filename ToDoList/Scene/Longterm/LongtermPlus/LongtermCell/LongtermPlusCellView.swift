//
//  LongtermPlusCellView.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/28.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class LongtermPlusCellView: UITableViewCell {
    static let identifier = "LongtermPlusCellView"
    
    let title = UILabel()
    let number = UILabel()
    let check = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: LongtermPlusCellModel) {
        
    }
    
    private func attribute() {
        selectionStyle = .none
        backgroundColor = .systemBackground
        
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        number.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        check.image = UIImage(systemName: "circle")
        
    }
    
    private func layout() {
        [
            title,
            number,
            check
        ].forEach { contentView.addSubview($0) }
        
        number.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16.0)
        }
        
        title.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(number.snp.trailing).offset(16.0)
        }
        
        check.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
    }
}
