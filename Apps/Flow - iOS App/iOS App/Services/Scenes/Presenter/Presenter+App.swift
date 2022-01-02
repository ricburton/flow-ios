import UIKit
import SparrowKit
import NativeUIKit
import Models

extension Presenter {
    
    enum App {
        
        static func showStorage(on navigationController: UINavigationController) {
            let controller = Controllers.Storage.main
            navigationController.pushViewController(controller)
        }
        
        static func showSettings(on navigationController: UINavigationController) {
            let controller = Controllers.Settings.main
            navigationController.pushViewController(controller)
        }
    }
}
