import UIKit
import SparrowKit
import NativeUIKit

open class TrackTableViewCell: SPTableViewCell {
    
    let trackNameLabel = SPLabel().do {
        $0.textColor = .label
        $0.numberOfLines = 1
        $0.font = UIFont.preferredFont(forTextStyle: .body, weight: .semibold, addPoints: 2).rounded
    }
    
    let artistNameLabel = SPLabel().do {
        $0.textColor = .secondaryLabel
        $0.numberOfLines = 1
        $0.font = UIFont.preferredFont(forTextStyle: .body, weight: .regular, addPoints: -2)
    }
    
    let iconView = SPView().do {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.roundCorners(radius: 6)
    }
    
    let durationLabel = SPLabel().do {
        $0.textColor = .secondaryLabel
        $0.numberOfLines = 1
        $0.font = UIFont.preferredFont(forTextStyle: .body, weight: .regular, addPoints: -2)
    }
    
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func commonInit() {
        super.commonInit()
        higlightStyle = .content
        contentView.layoutMargins.top = 12
        contentView.layoutMargins.bottom = 12
        contentView.addSubviews([trackNameLabel, artistNameLabel, iconView, durationLabel])
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        durationLabel.sizeToFit()
        durationLabel.setYCenter()
        durationLabel.setMaxXToSuperviewRightMargin()
        
        iconView.frame = .init(side: 40)
        iconView.setYCenter()
        iconView.setXToSuperviewLeftMargin()
        
        let space: CGFloat = NativeLayout.Spaces.default
        let labelsWidth = contentView.layoutWidth - durationLabel.frame.width - space * 2
        trackNameLabel.layoutDynamicHeight(x: iconView.frame.maxX + space, y: contentView.layoutMargins.top, width: labelsWidth)
        artistNameLabel.layoutDynamicHeight(x: trackNameLabel.frame.origin.x, y: trackNameLabel.frame.maxY + 3, width: labelsWidth)
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSize = super.sizeThatFits(size)
        return .init(width: superSize.width, height: artistNameLabel.frame.maxY + contentView.layoutMargins.bottom)
    }
    
    open override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        let higlightContent = (higlightStyle == .content)
        if higlightContent {
            [trackNameLabel, artistNameLabel, iconView, durationLabel].forEach({ $0?.alpha = highlighted ? 0.6 : 1 })
        }
    }
}
