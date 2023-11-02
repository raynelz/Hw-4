import UIKit

class SignInViewController: UIViewController {
    
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
        text.textAlignment = .center
        return text
    }()
    
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
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
        
        signInButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
        // Устанавливаем constraints
        setConstraints()
    }
    
    private func setConstraints() {
        companyImage.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            companyImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            companyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            companyImage.heightAnchor.constraint(equalToConstant: 100),
            companyImage.widthAnchor.constraint(equalToConstant: 100),
            
            textLabel.topAnchor.constraint(equalTo: companyImage.bottomAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
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
    
    @objc func nextPage() {
        let nextViewController = BillViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
