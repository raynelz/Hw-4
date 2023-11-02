//
//  ResultViewController.swift
//  Hw#4
//
//  Created by Захар Литвинчук on 02.11.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var billData: BillData
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    private let tableNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, tableNumberLabel])
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    init(billData: BillData) {
        self.billData = billData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mealOneLabel: UILabel = {
        let label = UILabel()
        label.text = "Салат Цезарь"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let mealTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "Салат Греческий"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        nameLabel.text = "ФИО: \(billData.name ?? "")"
        tableNumberLabel.text = "Номер стола: \(billData.tableNumber ?? "")"
        
        view.addSubview(stackView)
        
        
        setConstraints()
    }
    
    private func setConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}
