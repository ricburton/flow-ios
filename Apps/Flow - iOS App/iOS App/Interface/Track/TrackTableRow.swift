import UIKit
import SparrowKit
import SPDiffable

open class TrackTableRow: SPDiffableTableRow {
    
    public init(
        id: String,
        text: String,
        detail: String
    ) {
        super.init(
            id: id,
            text: text,
            detail: detail,
            icon: nil,
            accessoryType: .disclosureIndicator,
            selectionStyle: .none,
            action: { _, _ in
                
            }
        )
    }
}
