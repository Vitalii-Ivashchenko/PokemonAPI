import UIKit

class NewPokemonView: UIView {
    
    // MARK: - Closure Events
    
    var didTapAddButton: (() -> Void)?
    
    // MARK: - UIElements
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "xmark")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Name"
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let baseExperienceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Base experience"
        return label
    }()
    
    let baseExperienceTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Height"
        return label
    }()
    
    let heightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let widthLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Width"
        return label
    }()
    
    let widthTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle("ADD POKEMON", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackgroundColor()
        setupTargets()
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }
    
    private func setupTargets() {
        addButton.addTarget(self, action: #selector(tappedAddButton(_:)), for: .touchUpInside)
    }
    
    private func setupHierarchy() {
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(baseExperienceLabel)
        stackView.addArrangedSubview(baseExperienceTextField)
        stackView.addArrangedSubview(heightLabel)
        stackView.addArrangedSubview(heightTextField)
        stackView.addArrangedSubview(widthLabel)
        stackView.addArrangedSubview(widthTextField)
        addSubview(addButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            addButton.topAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor, constant: -50),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            addButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func tappedAddButton(_ sender: UIButton) {
        didTapAddButton?()
    }
}
