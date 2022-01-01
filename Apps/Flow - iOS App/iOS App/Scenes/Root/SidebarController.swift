import UIKit
import SPDiffable
import SparrowKit

class SidebarController: SPDiffableSideBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCellProviders(SPDiffableCollectionCellProvider.sideBar, sections: content)
        selectFirstBar()
        navigationItem.title = Texts.Shared.application_name
        
        if UIDevice.current.isMac {
            navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    @objc func updateContent() {
        diffableDataSource?.apply(content, animated: true)
    }
    
    var content: [SPDiffableSection] {
        return Navigation.sideBars.map { (barSection) -> SPDiffableSection in
            
            let diffableSection = SPDiffableSection(
                id: barSection.id,
                items: []
            )
            
            if let sectionTitle = barSection.title {
                diffableSection.header = SPDiffableSideBarHeader(text: sectionTitle, accessories: [.outlineDisclosure()])
            }
            
            for bar in barSection.rows {
                let bar = SPDiffableSideBarItem(id: bar.id, title: bar.title, image: bar.image) { [weak self] _, _ in
                    guard let self = self else { return }
                    self.splitViewController?.setViewController(bar.getController(), for: .secondary)
                }
                diffableSection.items.append(bar)
            }
            
            return diffableSection
        }
    }
    
    func selectFirstBar() {
        if (diffableDataSource?.snapshot().itemIdentifiers.isEmpty ?? true) { return }
        collectionView.selectItem(at: .init(item: .zero, section: .zero), animated: false, scrollPosition: .top)
    }
}
