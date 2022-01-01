import UIKit
import Constants

extension UISceneConfiguration {
    
    enum Scene {
        
        case root
        case storage
        case settings
        
        var id: String {
            switch self {
            case .root: return Constants.Scenes.root
            case .storage: return Constants.Scenes.storage
            case .settings: return Constants.Scenes.settings
            }
        }
    }
    
    convenience init(scene: Scene, role: UISceneSession.Role) {
        self.init(name: scene.id, sessionRole: role)
    }
}
