import UIKit
import SparrowKit

class PlaylistCollectionViewCell: SPCollectionViewCell {
    
    override func commonInit() {
        super.commonInit()
        contentView.roundCorners(radius: 12)
        contentView.backgroundColor = .secondarySystemBackground
    }
}
