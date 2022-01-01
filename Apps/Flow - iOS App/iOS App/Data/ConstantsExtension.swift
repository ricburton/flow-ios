import Foundation
import Constants

extension Constants {
    
    enum Bundles {
        
        static var app: String { "by.ivanvorobei.apps.flow" }
    }
    
    enum Scenes {
        
        static var root: String { "Root Scene" }
        static var storage: String { "Storage Scene" }
        static var settings: String { "Settings Scene" }
    }
    
    enum UserActivities {
        
        static var show_storage: String {  Constants.Bundles.app + ".showStorage" }
        static var show_settings: String {  Constants.Bundles.app + ".showSettings" }
    }
}
