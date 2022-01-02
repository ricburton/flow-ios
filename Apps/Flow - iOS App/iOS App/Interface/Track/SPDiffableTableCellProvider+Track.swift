import UIKit
import SPDiffable

@available(iOS 13.0, *)
extension SPDiffableTableCellProvider {
    
    public static var track: SPDiffableTableCellProvider  {
        return SPDiffableTableCellProvider() { (tableView, indexPath, item) -> UITableViewCell? in
            guard let item = item as? TrackTableRow else { return nil }
            let cell = tableView.dequeueReusableCell(withClass: TrackTableViewCell.self, for: indexPath)
            cell.trackNameLabel.text = item.text
            cell.artistNameLabel.text = item.detail
            cell.accessoryType = .disclosureIndicator
            cell.durationLabel.text = "\(Int.random(in: 0...59)):\(Int.random(in: 10...59))"
            cell.higlightStyle = .content
            return cell
        }
    }
}
