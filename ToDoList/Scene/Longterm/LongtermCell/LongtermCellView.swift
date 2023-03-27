//
//  LongtermCellView.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/27.
//

import UIKit

import RxSwift
import RxCocoa

final class LongtermCellView: UITableViewCell {
    static let identifier = "LongtermCellView"
    
    let disposeBag = DisposeBag()
    
    let longtermName = UILabel()
    let term = UILabel()
    let longtermCheck = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: LongtermCellModel) {
        
    }
    
    func setData(_ longterm: Longterm) {
        longtermCheck.setImage(UIImage(systemName: "circle"), for: .normal)
        longtermName.text = longterm.projectName
        term.text = longterm.term
    }
    
    private func attribute() {
        selectionStyle = .none
        backgroundColor = .systemBackground
        
        longtermName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        term.font = UIFont.systemFont(ofSize: 10, weight: .light)
    }
    
    private func layout() {
        [longtermName, term, longtermCheck].forEach {
            contentView.addSubview($0)
        }
        
        longtermCheck.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.bottom.equalToSuperview().inset(16.0)
        }
        
        longtermName.snp.makeConstraints {
            $0.leading.equalTo(longtermCheck.snp.trailing).offset(16.0)
            $0.top.equalToSuperview().inset(8.0)
        }
        
        term.snp.makeConstraints {
            $0.leading.equalTo(longtermCheck.snp.trailing).offset(16.0)
            $0.top.equalTo(longtermName.snp.bottom)
            $0.bottom.equalToSuperview().inset(8.0)
        }
    }
}
