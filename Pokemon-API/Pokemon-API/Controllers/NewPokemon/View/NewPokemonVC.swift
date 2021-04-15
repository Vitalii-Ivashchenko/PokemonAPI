import UIKit

class NewPokemonVC: UIViewController {
    
    private let customView = NewPokemonView()
    
    private var viewModel: NewPokemonViewModel! {
        didSet {
            viewModel.didChangeName = { [unowned self] viewModel in
                self.customView.nameTextField.text = viewModel.name
            }
        }
    }
    
    init(viewModel: NewPokemonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.didTapAddButton = {
//            viewModel.addNewPokemon(Pokemon())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
