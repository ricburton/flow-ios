import UIKit
import SparrowKit

class PlaylistCollectionViewCell: SPCollectionViewCell {
    
    let playlistView = PlaylistView()
    
    override func commonInit() {
        super.commonInit()
        contentView.addSubview(playlistView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard transform == .identity else { return }
        playlistView.setEqualSuperviewBounds()
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.16, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .beginFromCurrentState, animations: {
                self.transform = self.isHighlighted ? .init(scale: 0.9) : .identity
            }, completion: nil)
        }
    }
}
