import UIKit

class SignInViewController: UIViewController {
    //TextField Variables
    var username: String? {
        return emailTextField.text
    }
    
    var password: String? {
        return passwordTextField.text
    }
    
    // UI элементы
    private let companyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let text = UILabel()
        text.text = "Sign In"
        text.font = .systemFont(ofSize: 30, weight: .semibold)
        text.textAlignment = .left
        return text
    }()
    
    private let emailLabel: UILabel = {
        let text = UILabel()
        text.text = "Email"
        text.textColor = .systemRed
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        text.textAlignment = .left
        return text
    }()
    
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let text = UILabel()
        text.text = "Password"
        text.textColor = .systemRed
        text.font = .systemFont(ofSize: 15, weight: .semibold)
        text.textAlignment = .left
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField, passwordLabel,passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавляем элементы на view
        view.addSubview(companyImage)
        view.addSubview(textLabel)
        view.addSubview(loginStackView)
        view.addSubview(signInButton)
        
        signInButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        // Устанавливаем constraints
        setConstraints()
    }
    
    private func setConstraints() {
        companyImage.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            companyImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            companyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            companyImage.heightAnchor.constraint(equalToConstant: 100),
            companyImage.widthAnchor.constraint(equalToConstant: 100),
            
            textLabel.topAnchor.constraint(equalTo: companyImage.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            loginStackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            loginStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 250),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: LOGIN EMAIL & PASSWORD
    @objc func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        if username.isEmpty || password.isEmpty {
            print("Username / password cannot be blank")
            return
        } else if username == "Test@test.ru" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            
            navigationController?.pushViewController(BillViewController(), animated: true)
        }
        
    }
}



