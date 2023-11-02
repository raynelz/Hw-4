//
//  BillViewController.swift
//  Hw#4
//
//  Created by Захар Литвинчук on 02.11.2023.
//

import UIKit

class BillViewController: UIViewController {
    
    // UI элементы
    private let testText: UILabel = {
        let text = UILabel()
        text.text = "Test passed!"
        text.font = .systemFont(ofSize: 40, weight: .semibold)
        return text
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cafe Mario"
        
        view.addSubview(testText)
        
        setConstraints()
    }
    
    private func setConstraints() {
        testText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            testText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
