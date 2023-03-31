//
//  LongtermPlusViewController.swift
//  ToDoList
//
//  Created by 전성훈 on 2023/03/27.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class LongtermPlusViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let longtermTitle = UITextField()
    let calIcon = UIImageView()
    let longtermDate = UITextField()
    let descriptionIcon = UIImageView()
    let descriptionTable = UITableView(frame: .zero, style: .insetGrouped)
    let descriptionPlus = UIButton()
    let checkLongterm = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    func bind(_ viewModel: LongtermPlusViewModel) {
        viewModel.cellData
            .drive(descriptionTable.rx.items) { tableView, row, data in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LongtermPlusCellView.identifier,
                    for: IndexPath(row: row, section: 0)
                ) as? LongtermPlusCellView
                cell?.setData(data)
                
                return cell ?? UITableViewCell()
                
            }.disposed(by: disposeBag)
    }
    
    private func attribute() {
        view.backgroundColor = .systemGray6
        navigationItem.title = "작업 추가"
        
        // checkLongterm
        checkLongterm.image = UIImage(systemName: "paperplane")
        checkLongterm.style = .done
        checkLongterm.isEnabled = false
        navigationItem.rightBarButtonItem = checkLongterm
        
        // longterm
        longtermTitle.placeholder = "TestLongTitle"
        longtermTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        // calIcon
        calIcon.image = UIImage(systemName: "calendar")
        
        // longtermDate
        longtermDate.text = "2023-02-22 ~ 2033-23-14"
        
        // descriptionIcon
        descriptionIcon.image = UIImage(systemName: "wallet.pass")
        
        // descriptionTable
        descriptionTable.backgroundColor = .clear
        descriptionTable.register(
            LongtermPlusCellView.self,
            forCellReuseIdentifier: LongtermPlusCellView.identifier
        )
        
        // descriptionPlus
        var attText = AttributedString.init("세부사항 추가하기")
        attText.obliqueness = 0.2
        attText.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        descriptionPlus.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        descriptionPlus.setTitleColor(.systemOrange, for: .normal)
        descriptionPlus.configuration = .tinted()
        descriptionPlus.configuration?.cornerStyle = .capsule
        descriptionPlus.configuration?.attributedTitle = attText
        descriptionPlus.configuration?.imagePadding = 15
        
    }
    
    private func layout() {
        [
            longtermTitle,
            calIcon,
            longtermDate,
            descriptionIcon,
            descriptionTable,
            descriptionPlus
        ].forEach { view.addSubview($0)}
        
        longtermTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16.0)
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        calIcon.snp.makeConstraints {
            $0.top.equalTo(longtermTitle.snp.bottom).offset(32.0)
            $0.leading.equalToSuperview().inset(16.0)
        }
        
        longtermDate.snp.makeConstraints {
            $0.top.equalTo(longtermTitle.snp.bottom).offset(32.0)
            $0.leading.equalTo(calIcon.snp.trailing).offset(16.0)
        }
        
        descriptionIcon.snp.makeConstraints {
            $0.top.equalTo(longtermDate.snp.bottom).offset(16.0)
            $0.leading.equalToSuperview().inset(16.0)
            $0.width.equalTo(calIcon.snp.width)
        }

        descriptionPlus.snp.makeConstraints {
            $0.top.equalTo(longtermDate.snp.bottom).offset(16.0)
            $0.width.equalTo(descriptionTable.snp.width).dividedBy(2)
            $0.centerX.equalToSuperview().offset(16.0)
        }
        
        descriptionTable.snp.makeConstraints {
            $0.top.equalTo(descriptionPlus.snp.bottom).offset(16.0)
            $0.leading.equalTo(descriptionIcon.snp.trailing).offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}
