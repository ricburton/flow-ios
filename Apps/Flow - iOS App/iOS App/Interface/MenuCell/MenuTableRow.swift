import UIKit
import SparrowKit
import SPDiffable

class MenuTableRow: SPDiffableTableRow {
    
    var higlightStyle: SPTableViewCell.HiglightStyle
    var textColor: UIColor
    var detailColor: UIColor
    
    init(
        id: String? = nil,
        text: String,
        textColor: UIColor = .label,
        detail: String? = nil,
        detailColor: UIColor = .secondaryLabel,
        icon: UIImage? = nil,
        accessoryType: UITableViewCell.AccessoryType = .none,
        higlightStyle: SPTableViewCell.HiglightStyle = .none,
        action: SPDiffableTableRow.Action? = nil
    ) {
        self.higlightStyle = higlightStyle
        self.textColor = textColor
        self.detailColor = detailColor
        
        super.init(
            id: id,
            text: text,
            detail: detail,
            icon: icon,
            accessoryType: accessoryType,
            selectionStyle: higlightStyle.selectionStyle,
            action: action
        )
    }
}
