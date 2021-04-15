import UIKit

class PokemonsViewController: UITableViewController {

    private let reuseIdentifier = NSStringFromClass(PokemonsViewController.self)
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredResults = [Pokemon]()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private let viewModel: PokemonsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .systemBackground
        tableView.register(PokemonsCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        setupNavigationViews()
        setupSearchController()
        
        viewModel.getPokemons()
        viewModel.updateView = { [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    private func setupNavigationViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddPokemonButton))
        
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupSearchController() {
        navigationItem.searchController = searchController
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        definesPresentationContext = true
    }
    
    @objc private func tappedAddPokemonButton() {
        viewModel.tappedAddPokemon()
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? PokemonsCell else {
            return UITableViewCell()
        }
         
        let pokemon = viewModel.getPokemon(at: indexPath)
        cell.pokemonImage.image = pokemon.image
        cell.nameLabel.text = pokemon.name.capitalizeFirstLetter()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Initializers
    
    init(viewModel: PokemonsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        //filteredResults = viewModel.getPokemons()
    }
}
