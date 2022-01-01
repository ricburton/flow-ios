import UIKit
import SparrowKit
import Models

enum Navigation {
    
    // MARK: - Controllers
    
    static var rootController: UIViewController {
        return SideBarSplitController()
    }
    
    static var compactRootController: UIViewController {
        return CompactRootController()
    }
    
    // MARK: - Bars
    
    static var tabBars: [BarRowModel] {
        return basicBars(for: .tabBar)
    }
    
    static var sideBars: [BarSectionModel] {
        return [
            BarSectionModel(.home, items: basicBars(for: .sideBar)),
            BarSectionModel(
                .playlists,
                items: [
                    BarRowModel(id: "section", title: "Title", image: .init(), getController: {
                        return UIViewController()
                    })
                ]
                    
            )
        ]
    }
    
    // MARK: - Internal
    
    private static func basicBars(for usage: BarUsage) -> [BarRowModel] {
        return [
            BarRowModel(id: "home", title: "Title", image: .init(), getController: {
                return UIViewController()
            })
        ]
    }
}
