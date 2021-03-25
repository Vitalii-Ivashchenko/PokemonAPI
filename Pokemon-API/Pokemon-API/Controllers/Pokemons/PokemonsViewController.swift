//
//  PokemonsViewController.swift
//  Pokemon-API
//
//  Created by Віталій on 25.03.2021.
//

import UIKit

class PokemonsViewController: UICollectionViewController {

    private let reuseIdentifier = NSStringFromClass(PokemonsViewController.self)
    
    private let pokemons = [Pokemon]()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(PokemonsCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        NetworkManager.request(type: PokemonResponse.self, urlString: "https://pokeapi.co/api/v2/pokemon/?limit=100000") { (isSuccess) in
            
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PokemonsCell else {
            return UICollectionViewCell()
        }
         
        let pokemon = pokemons[indexPath.row]
        
        cell.image.image = UIImage(systemName: "xmark")
        cell.name.text = pokemon.name
        
        return cell
    }
}
