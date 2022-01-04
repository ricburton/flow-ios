import UIKit
import SparrowKit
import SPDiffable
import NativeUIKit

class PlaylistController: NativeHeaderTableController {
    
    // MARK: - Views
    
    public let headerView = PlaylistHeaderView()
    
    // MARK: - Init
    
    public init() {
        super.init(style: .insetGrouped, headerView: headerView)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = .init(title: nil, image: .system("ellipsis.circle.fill"), primaryAction: nil, menu: nil)
        
        navigationItem.largeTitleDisplayMode = .never
        tableView.register(TrackTableViewCell.self)
        setCellProviders([.track], headerFooterProviders: [.largeHeader], sections: content)
    }
    
    // MARK: - Diffable
    
    internal enum Section: String {
        
        case tracks
        
        var id: String { rawValue + "_section" }
    }
    
    private var content: [SPDiffableSection] {
        return [
            .init(
                id: Section.tracks.id,
                header: nil,
                footer: nil,
                items: fakeLibraryData
            )
        ]
    }
    
    private var fakeLibraryData: [TrackTableRow] {
        [
            .init(id: "1", text: "Abayo Stevens", detail: "Kathmandu"),
            .init(id: "2", text: "Alexa Tenorio", detail: "Tianjin"),
            .init(id: "3", text: "Samuil Sadovsky", detail: "Riga"),
            .init(id: "4", text: "Chineze Uchechey", detail: "Halifax"),
            .init(id: "5", text: "Abayo Stevens", detail: "Kathmandu"),
            .init(id: "6", text: "Alexa Tenorio", detail: "Tianjin"),
            .init(id: "7", text: "Samuil Sadovsky", detail: "Riga"),
            .init(id: "8", text: "Chineze Uchechey", detail: "Halifax")
        ]
    }
}
