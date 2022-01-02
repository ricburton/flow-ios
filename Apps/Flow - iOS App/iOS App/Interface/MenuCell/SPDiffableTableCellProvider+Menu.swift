import UIKit
import SPDiffable

extension SPDiffableTableCellProvider {
    
    public static var menu: SPDiffableTableCellProvider  {
        return SPDiffableTableCellProvider() { (tableView, indexPath, item) -> UITableViewCell? in
            guard let item = item as? MenuTableRow else { return nil }
            let cell = tableView.dequeueReusableCell(withClass: MenuTableViewCell.self, for: indexPath)
            cell.textLabel?.text = item.text
            cell.textLabel?.textColor = item.textColor
            cell.detailTextLabel?.text = item.detail
            cell.detailTextLabel?.textColor = item.detailColor
            cell.imageView?.image = item.icon
            cell.accessoryType = item.accessoryType
            cell.higlightStyle = item.higlightStyle
            return cell
        }
    }
}
