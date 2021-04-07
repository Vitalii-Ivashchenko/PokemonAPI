import Foundation
import CoreData


extension PokemonCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonCharacter> {
        return NSFetchRequest<PokemonCharacter>(entityName: "PokemonCharacter")
    }

    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var detailURL: URL?

}

extension PokemonCharacter : Identifiable {

}
