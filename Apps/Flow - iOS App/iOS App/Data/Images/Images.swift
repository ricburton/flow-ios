import UIKit

enum Images {
    
    enum Bar {
        
        static var playlists: UIImage { .adaptive("music.note.list") }
    }
    
    enum Menu {
        
        static var add: UIImage { .system("plus") }
        static var add_circle: UIImage { .system("plus.circle") }
        static var add_rectangle: UIImage { .system("plus.rectangle") }
        static var edit: UIImage { .system("pencil") }
        static var delete: UIImage { .system("trash") }
        static var checkmark: UIImage { .system("checkmark") }
        static var checkmark_circle_fill: UIImage { .system("checkmark.circle.fill") }
        static var profile: UIImage {  .system("person") }
        static var settings: UIImage { .system("gear") }
    }
    
    enum Table {
        
        static var edit: UIImage { .system("pencil") }
        static var close_app: UIImage { .system("xmark.app.fill") }
        static var close_square: UIImage { .system("xmark.square.fill") }
        static var delete: UIImage { .system("trash.fill") }
    }
}
