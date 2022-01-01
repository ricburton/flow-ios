import UIKit
import SparrowKit

enum Controllers {
    
    enum Library {
        
        static var main: UIViewController { SPController() }
    }
    
    enum Playlists {
        
        static var list: UIViewController { SPController() }
    }
    
    enum Storage {
        
        static var main: UIViewController { SPController() }
    }
    
    enum Settings {
        
        static var main: UIViewController { SPController() }
    }
}
