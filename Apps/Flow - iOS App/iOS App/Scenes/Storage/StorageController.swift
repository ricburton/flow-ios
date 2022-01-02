import UIKit
import SPDiffable

class StorageController: SPDiffableTableController {
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Texts.Storage.title
        navigationItem.largeTitleDisplayMode = .never
        setCellProviders(SPDiffableTableCellProvider.default, sections: [])
    }
}
