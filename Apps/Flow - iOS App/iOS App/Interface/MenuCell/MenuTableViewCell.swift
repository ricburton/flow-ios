import UIKit
import SparrowKit

class MenuTableViewCell: SPTableViewCell {
    
    override func commonInit() {
        super.commonInit()
        higlightStyle = .content
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSize = super.sizeThatFits(size)
        return .init(width: superSize.width, height: superSize.height + 4)
    }
}
