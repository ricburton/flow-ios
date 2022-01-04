import UIKit
import SparrowKit
import SPDiffable

class PlaylistCollectionView: SPDiffableCollectionView, SPDiffableCollectionDelegate {

    static let itemSize: CGSize = .init(width: 125, height: 145)
    
    let layout = UICollectionViewFlowLayout()
    
    override init() {
        super.init()
        layoutMargins = .zero
        layout.itemSize = Self.itemSize
        layout.scrollDirection = .horizontal
        layout.sectionInsetReference = .fromLayoutMargins
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        setCollectionViewLayout(layout, animated: false)
        register(PlaylistCollectionViewCell.self)
        setCellProviders([
            .init(clouser: { collectionView, indexPath, itemIdentifier in
                let cell = collectionView.dequeueReusableCell(withClass: PlaylistCollectionViewCell.self, for: indexPath)
                return cell
            })
        ], sections: content)
        
        diffableDataSource?.diffableDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal var content: [SPDiffableSection] {
        return [
            .init(id: "section", items: [
                .init(id: "1"),
                .init(id: "2"),
                .init(id: "3"),
                .init(id: "4"),
                .init(id: "5"),
                .init(id: "6"),
                .init(id: "7")
            ])
        ]
    }
    
    func diffableCollectionView(_ collectionView: UICollectionView, didSelectItem item: SPDiffableItem, indexPath: IndexPath) {
        let controller = PlaylistController()
        viewController?.navigationController?.pushViewController(controller, completion: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if layout.scrollDirection == .horizontal {
            if let superview = superview {
                layoutMargins.left = superview.layoutMargins.left
                layoutMargins.right = superview.layoutMargins.right
            }
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return .init(width: size.width, height: Self.itemSize.height)
    }
}
