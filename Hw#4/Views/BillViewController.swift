//
//  BillViewController.swift
//  Hw#4
//
//  Created by Захар Литвинчук on 02.11.2023.
//

import UIKit

class BillViewController: UIViewController {
    
    // UI элементы
    private let FIOLabel: UILabel = {
        let text = UILabel()
        text.text = "ФИО"
        text.textColor = .systemRed
        text.textAlignment = .left
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        return text
    }()
    
    private let GuestsLabel: UILabel = {
        let text = UILabel()
        text.text = "Количество гостей"
        text.textColor = .systemRed
        text.textAlignment = .left
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        return text
    }()
    
    private let TableCountLabel: UILabel = {
        let text = UILabel()
        text.text = "Номер стола"
        text.textColor = .systemRed
        text.textAlignment = .left
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        return text
    }()
    
    private let FIOTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите фио"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private let CountOfGuestsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите количество"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let NumberOfTableTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Стол номер"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let tableLabel: UILabel = {
        let text = UILabel()
        text.text = "Бронировать стол?"
        text.textColor = .systemRed
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        text.textAlignment = .left
        return text
    }()
    
    private let preorderLabel: UILabel = {
        let text = UILabel()
        text.text = "Предоплата?"
        text.textColor = .systemRed
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        text.textAlignment = .left
        return text
    }()
    
    private let vipLabel: UILabel = {
        let text = UILabel()
        text.text = "VIP комната?"
        text.textColor = .systemRed
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        text.textAlignment = .left
        return text
    }()
    
    private lazy var switchStackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [tableLabel, TableReserveSwitch, preorderLabel, PreorderSwitch, vipLabel, VIPRoomSwitch])
        
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let TableReserveSwitch: UISwitch = UISwitch()
    private let PreorderSwitch: UISwitch = UISwitch()
    private let VIPRoomSwitch: UISwitch = UISwitch()
    
    private lazy var textFieldsStackView: UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [FIOLabel, FIOTextField, GuestsLabel, CountOfGuestsTextField, TableCountLabel, NumberOfTableTextField])
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    //MARK: HORIZONTAL STACK VIEWS
    private lazy var horizotalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tableLabel, TableReserveSwitch])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private lazy var horizontalStackViewTwo: UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [preorderLabel, PreorderSwitch])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }() 
    
    private lazy var horizontalStackViewThree: UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [vipLabel, VIPRoomSwitch])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [horizotalStackView, horizontalStackViewTwo, horizontalStackViewThree])
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()

    
    private let billButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выставить счёт", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: nil, message: "Продолжить?", preferredStyle: .alert)

           let yesAction = UIAlertAction(title: "Да", style: .default) { _ in
               let billData = BillData(name: self.FIOTextField.text, tableNumber: self.NumberOfTableTextField.text)
               self.navigationController?.pushViewController(ResultViewController(billData: billData), animated: true)
              
           }

           let noAction = UIAlertAction(title: "Нет", style: .cancel, handler: nil)

           alertController.addAction(yesAction)
           alertController.addAction(noAction)

           present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //BarButtonItem
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem

        billButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        title = "Cafe Mario"
        view.addSubview(textFieldsStackView)
        view.addSubview(verticalStackView)
        view.addSubview(billButton)
        
        setConstraints()
    }
    
    private func setConstraints() {
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        billButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textFieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            verticalStackView.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 20),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            

            billButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            billButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            billButton.widthAnchor.constraint(equalToConstant: 250),
            billButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
