import UIKit
import Constants

class SceneUserActivity: NSUserActivity {
    
    let action: Action
    
    init(_ action: Action) {
        self.action = action
        super.init(activityType: action.id)
    }
    
    var scene: UISceneConfiguration.Scene {
        switch action {
        case .showStorage:
            return .storage
        case .showSettings:
            return .settings
        }
    }
    
    // MARK: - Models
    
    enum Action {
        
        case showStorage
        case showSettings
        
        fileprivate var id: String {
            switch self {
            case .showStorage: return Constants.UserActivities.show_storage
            case .showSettings: return Constants.UserActivities.show_settings
            }
        }
    }
}
