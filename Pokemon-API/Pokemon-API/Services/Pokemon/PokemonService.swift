import Foundation

class PokemonWebService: PokemonServiceProtocol {
    
    func getPokemons(completion: @escaping ([Pokemon]?) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=1")
        NetworkManager.request(with: url) { (result) in
            
            switch result {
            case .success(let data):
                let pokemonsFromResponse = PokemonParser.parsePokemons(from: data)
                
                var pokemons = [Pokemon]()
                
                let dispatchGroup = DispatchGroup()
                for pokemon in pokemonsFromResponse {
                    
                    dispatchGroup.enter()
                    
                    GoogleSearchImageService.getImage(with: pokemon.name) { (image) in

                        guard let image = image else {
                            dispatchGroup.leave()
                            print("error")
                            return
                        }

                        let newPokemon = Pokemon(name: pokemon.name, image: image, baseExperience: 100, height: 5, weight: 10)
                        pokemons.append(newPokemon)

                        dispatchGroup.leave()
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    completion(pokemons)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
