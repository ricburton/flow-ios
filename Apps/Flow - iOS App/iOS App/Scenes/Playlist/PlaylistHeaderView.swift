import UIKit
import SparrowKit
import NativeUIKit

open class PlaylistHeaderView: SPView {
    
    let playlistView = PlaylistView().do {
        $0.backgroundColor = .systemBackground
        $0.label.isHidden = true
    }
    
    let playlistLabel = SPLabel().do {
        $0.font = .preferredFont(forTextStyle: .title2, weight: .semibold).rounded
        $0.numberOfLines = 1
        $0.textColor = .black
        $0.text = ["First", "Other", "To Check", "Flow", "Best"].randomElement()
        $0.textAlignment = .center
    }
    
    let descriptionLabel = SPLabel().do {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.numberOfLines = 1
        $0.textColor = .secondaryLabel
        $0.text = "12 tracks"
        $0.textAlignment = .center
    }
    
    let editButton = SPDimmedButton().do {
        $0.tintColor = .blue
        $0.setImage(.system("pencil.circle.fill").alwaysTemplate, for: .normal)
        $0.applyDefaultAppearance(with: .init(content: .tint, background: .clear))
    }
    
    // MARK: - Private
    
    private var extendView = SPView()
    
    // MARK: - Init
    
    open override func commonInit() {
        super.commonInit()
        layoutMargins.bottom = NativeLayout.Spaces.default_double
        backgroundColor = .clear
        addSubviews([extendView, playlistView, playlistLabel, descriptionLabel, editButton])
    }
    
    // MARK: - Ovveride
    
    open override var backgroundColor: UIColor? {
        didSet {
            extendView.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        playlistView.frame = .init(x: 0, y: 0, width: 125, height: 125)
        playlistView.squareView.setToCenter()
        playlistView.setXCenter()
        playlistView.frame.origin.y = 35
        extendView.frame = .init(x: .zero, maxY: .zero, width: frame.width, height: 1000)
        
        playlistLabel.layoutDynamicHeight(width: layoutWidth)
        playlistLabel.sizeToFit()
        playlistLabel.setXCenter()
        playlistLabel.frame.origin.y = playlistView.frame.maxY + 24
        
        descriptionLabel.layoutDynamicHeight(width: layoutWidth)
        descriptionLabel.sizeToFit()
        descriptionLabel.setXCenter()
        descriptionLabel.frame.origin.y = playlistLabel.frame.maxY + 4
        
        editButton.sizeToFit()
        editButton.center.y = playlistLabel.center.y
        editButton.frame.origin.x = playlistLabel.frame.maxX + 6
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        layoutSubviews()
        return .init(width: frame.width, height: descriptionLabel.frame.maxY + layoutMargins.bottom)
    }
}
