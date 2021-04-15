import UIKit

class PokemonsCell: UITableViewCell {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        return activityIndicator
    }()
    
    let pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImage.image = nil
        nameLabel.text = nil
        activityIndicator.startAnimating()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        activityIndicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(pokemonImage)
        stackView.addArrangedSubview(nameLabel)
        
        pokemonImage.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            pokemonImage.widthAnchor.constraint(equalToConstant: 100),
            pokemonImage.heightAnchor.constraint(equalTo: pokemonImage.widthAnchor)
        ])
    }
}
