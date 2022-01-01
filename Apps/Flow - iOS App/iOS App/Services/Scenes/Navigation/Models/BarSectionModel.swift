import UIKit
import Models

struct BarSectionModel {
    
    let id: String
    let title: String?
    let rows: [BarRowModel]
    
    init(id: String, title: String?, rows: [BarRowModel]) {
        self.id = id
        self.title = title
        self.rows = rows
    }
    
    enum Item: String, CaseIterable {
        
        case home
        case playlists
        
        var id: String { return rawValue + "_section" }
    }
    
    init(_ item: Item, items: [BarRowModel]) {
        switch item {
        case .home:
            self.init(
                id: item.id,
                title: UIDevice.current.isMac ? Texts.Shared.application_name : nil,
                rows: items
            )
        case .playlists:
            self.init(id: item.id, title: "Playlists", rows: items)
        }
    }
}
