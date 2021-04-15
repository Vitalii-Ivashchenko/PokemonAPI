import Foundation

struct PokemonServiceResponse: Decodable {
    
    struct Pokemon: Decodable {
        let name: String
        let url: String
    }
    
    let pokemons: [PokemonServiceResponse.Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pokemons = try container.decode([PokemonServiceResponse.Pokemon].self, forKey: .pokemons)
    }
}
