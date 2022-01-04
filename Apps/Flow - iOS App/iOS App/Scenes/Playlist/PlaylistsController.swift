import UIKit
import SparrowKit

class PlaylistsController: SPController {
    
    let collectionView = PlaylistCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        navigationItem.title = "Playlsits"
        collectionView.layout.scrollDirection = .vertical
        collectionView.layout.itemSize = .init(width: 110, height: 135)
        collectionView.preservesSuperviewLayoutMargins = true
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setEqualSuperviewBounds()
    }
}
