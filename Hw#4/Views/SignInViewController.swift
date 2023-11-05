import UIKit

class SignInViewController: UIViewController {
    //MARK: - TextField Variables
    var email: String? {
        return emailTextField.text
    }
    
    var password: String? {
        return passwordTextField.text
    }
    
    //MARK: - UI Elements
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
    
    //MARK: - loginStackView
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
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .systemRed
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let passwordToggleButton = UIButton(type: .custom)
        passwordToggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        passwordToggleButton.tintColor = .systemRed
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        passwordTextField.rightView = passwordToggleButton
        passwordTextField.rightViewMode = .whileEditing
        
        signInButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        // Добавляем элементы на view
        view.addSubview(companyImage)
        view.addSubview(textLabel)
        view.addSubview(loginStackView)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        // Устанавливаем constraints
        setConstraints()
    }
    
    //passwordToggleButton
    @objc func togglePasswordVisibility(_ sender: UIButton) {
          sender.isSelected = !sender.isSelected
          passwordTextField.isSecureTextEntry = !sender.isSelected
      }
    
    //signInButton
    @objc func login() {
        guard let email = email, let password = password else {
            assertionFailure("Email / password should never be nil")
            return
        }
        if email.isEmpty || password.isEmpty {
            errorLabel.text = "Email / password cannot be blank"
            return
        } else if email == "zahar@raynelz.ru" && password == "strongPassword" {
            navigationController?.pushViewController(FormationViewController(), animated: true)
        }
        
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        companyImage.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
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
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 250),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            errorLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            errorLabel.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor)
        ])
    }
}
