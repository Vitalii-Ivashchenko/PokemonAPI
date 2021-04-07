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
        
        viewModel.updateView = { data in
            print("Something happened!")
        }
        
//        let url = URL(string: "https://www.googleapis.com/customsearch/v1?q=bulbasaur&num=1&key=AIzaSyAutyBO1nKj3TS6D9gJHxpB6PLY44ZzN70&cx=a9c734f58c720acac&searchType=image&alt=json")!
//        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            let asd = try! JSONDecoder().decode(GoogleResponse.self, from: data!)
//            print(asd.items.first?.link ?? "")
//
//            URLSession.shared.dataTask(with: asd.items.first?.link!, ca) { daat, response, error
//
//            }
//        }.resume()
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
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? PokemonsCell else {
            return UITableViewCell()
        }
         
//        let pokemon = pokemons[indexPath.row]
//        //print(pokemon.url)
//        cell.pokemonImage.image = UIImage(systemName: "xmark")
//        cell.name.text = pokemon.name.capitalizeFirstLetter()
        
        return cell
    }
    
    // MARK: - Initializers
    
    init(viewModel: PokemonsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = PokemonsViewModel()
        super.init(coder: coder)
    }
}

extension PokemonsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        //filteredResults = viewModel.getPokemons()
    }
}
