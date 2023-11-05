//
//  ResultViewController.swift
//  Hw#4
//
//  Created by Захар Литвинчук on 02.11.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - TableView Data
    var menuItems: [MenuItem] = [
        MenuItem(name: "Салат Цезарь", description: "Помидор, салат айсберг, курица", price: "300 р"),
        MenuItem(name: "Салат Греческий", description: "Помидоры, маслины, огурцы, фета, лук-шалот", price: "400 р")
    ]
    //MARK: - UI Elements
    private let tableView: UITableView =  {
        let table = UITableView.init(frame: CGRect.zero, style: .plain)
        return table
    }()
    
    private let totalContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого: 700 руб"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Чек"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(totalContainerView)
        totalContainerView.addSubview(totalLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        totalContainerView.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //tableView
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //totalContainerView
            totalContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -60),
            totalContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totalContainerView.widthAnchor.constraint(equalToConstant: 200),
            totalContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            //totalLabel
            totalLabel.topAnchor.constraint(equalTo: totalContainerView.topAnchor),
            totalLabel.bottomAnchor.constraint(equalTo: totalContainerView.bottomAnchor),
            totalLabel.leadingAnchor.constraint(equalTo: totalContainerView.leadingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: totalContainerView.trailingAnchor)
        ])
    }
}

//MARK: - UITableViewDelegate && UITableViewDataSource
extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CustomCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        let menuItem = menuItems[indexPath.row]
        cell!.textLabel?.text = menuItem.name
        cell!.detailTextLabel?.text = menuItem.description
        cell!.detailTextLabel?.textColor = .gray
        
        // Создание собственного accessoryView
        let accessoryLabel = UILabel()
        accessoryLabel.text = menuItem.price
        accessoryLabel.sizeToFit() // Размер label подгоняется под содержимое
        
        let accessoryImage = UIImageView(image: UIImage(systemName: "chevron.right"))
        accessoryImage.tintColor = .lightGray
        accessoryImage.frame = CGRect(x: accessoryLabel.frame.width + 5, y: 0, width: 15, height: 15)
        accessoryImage.contentMode = .scaleAspectFit
        
        let accessoryView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: accessoryLabel.frame.width + accessoryImage.frame.width + 5,
            height: max(accessoryLabel.frame.height, accessoryImage.frame.height)
        ))
        
        accessoryView.addSubview(accessoryLabel)
        accessoryView.addSubview(accessoryImage)
        
        // Установка собственного accessoryView
        cell!.accessoryView = accessoryView
        
        return cell!
    }
}
