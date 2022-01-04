import UIKit
import SparrowKit

class PlaylistView: SPView {
    
    let label = SPLabel().do {
        $0.font = .preferredFont(forTextStyle: .headline)
        $0.numberOfLines = 1
        $0.textColor = .tint
        $0.text = ["First", "Other", "To Check", "Flow", "Best"].randomElement()
        $0.textAlignment = .center
    }
    
    let squareView = SquareView()
    
    override func commonInit() {
        super.commonInit()
        roundCorners(radius: 12)
        backgroundColor = .secondarySystemBackground
        layoutMargins = .init(horizontal: 12, vertical: 16)
        addSubview(label)
        addSubview(squareView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.setWidthAndFit(width: layoutWidth)
        label.frame.setMaxY(frame.height - layoutMargins.bottom)
        label.setXCenter()
        
        let minSide = min(layoutWidth, label.frame.origin.y - layoutMargins.top - 8)
        squareView.frame = .init(side: minSide)
        squareView.setXCenter()
        squareView.frame.origin.y = layoutMargins.top
    }
    
    class SquareView: SPView {
        
        let leftTopView = SPView()
        let rightTopView = SPView()
        let leftBottomView = SPView()
        let rightBottomView = SPView()
        
        override func commonInit() {
            super.commonInit()
            var views = [leftTopView, rightTopView, leftBottomView]
            if Bool.random() {
                views.append(rightBottomView)
            }
            for view in views {
                addSubview(view)
                view.backgroundColor = .secondarySystemBackground.darker(by: 0.05)
                view.roundCorners(radius: 4)
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            let minSide = min(frame.width, frame.height)
            let space: CGFloat = 3
            let side = (minSide - space) / 2
            leftTopView.frame = .init(x: 0, y: 0, side: side)
            leftBottomView.frame = .init(x: 0, y: 0, side: side)
            leftBottomView.frame.setMaxY(frame.height)
            
            rightTopView.frame = .init(x: 0, y: 0, side: side)
            rightTopView.frame.setMaxX(frame.width)
            rightBottomView.frame = .init(x: 0, y: 0, side: side)
            rightBottomView.frame.setMaxY(frame.height)
            rightBottomView.frame.setMaxX(frame.width)
            
        }
    }
}


