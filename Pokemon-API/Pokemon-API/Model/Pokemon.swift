import Foundation

struct PokemonResponse: Decodable {
    
    let pokemons: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pokemons = try container.decode([Pokemon].self, forKey: .pokemons)
    }
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}
