import UIKit
import SparrowKit
import SPDiffable
import NativeUIKit

class HomeController: NativeHeaderTableController {
    
    // MARK: - Views
    
    public let headerView = HeaderHomeView()
    
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
        navigationItem.title = Texts.Shared.application_name
        navigationItem.rightBarButtonItem = .init(systemItem: .add, primaryAction: .init(handler: { _ in
            
        }), menu: nil)
        tableView.register(NativeLeftButtonTableViewCell.self)
        tableView.register(TrackTableViewCell.self)
        tableView.register(NativeMenuTableViewCell.self)
        setCellProviders([.menu, .track, .button], headerFooterProviders: [.largeHeader], sections: content)
    }
    
    // MARK: - Diffable
    
    internal enum Section: String {
        
        case library
        case storage
        case settings
        
        var id: String { rawValue + "_section" }
    }
    
    internal enum Item: String {
        
        case storage
        case settings

        var id: String { rawValue + "_row" }
    }
    
    private var content: [SPDiffableSection] {
        return [
            .init(
                id: Section.library.id,
                header: NativeLargeHeader(
                    title: Texts.Library.title,
                    actionTitle: "See All",
                    action: { item, indexPath in
                        guard let navigationController = self.navigationController else { return }
                        Presenter.pushExample(on: navigationController)
                    }
                ),
                footer: nil,
                items: fakeLibraryData + [
                    NativeDiffableLeftButton(
                        text: "Open All Tracks",
                        textColor: .systemBlue,
                        detail: "31 Tracks",
                        detailColor: .gray,
                        icon: nil,
                        accessoryType: .disclosureIndicator,
                        action: { item, indexPath in
                            guard let navigationController = self.navigationController else { return }
                            Presenter.pushExample(on: navigationController)
                        })
                ]
            ),
            .init(
                id: Section.storage.id,
                header: nil,
                footer: SPDiffableTextHeaderFooter.init(text: Texts.Storage.description),
                items: [
                    NativeDiffableMenuTableRow(
                        id: Item.storage.id,
                        text: Texts.Storage.title,
                        textColor: .label,
                        detail: nil,
                        detailColor: .secondaryLabel,
                        icon: Images.Table.storage,
                        accessoryType: .disclosureIndicator,
                        higlightStyle: .content,
                        action: { item, indexPath in
                            guard let navigationController = self.navigationController else { return }
                            Presenter.App.showStorage(on: navigationController)
                        }
                    )
                ]
            ),
            .init(
                id: Section.settings.id,
                header: nil,
                footer: SPDiffableTextHeaderFooter.init(text: Texts.Settings.description),
                items: [
                    NativeDiffableMenuTableRow(
                        id: Item.settings.id,
                        text: Texts.Settings.title,
                        textColor: .label,
                        detail: nil,
                        detailColor: .secondaryLabel,
                        icon: Images.Table.settings,
                        accessoryType: .disclosureIndicator,
                        higlightStyle: .content,
                        action: { item, indexPath in
                            guard let navigationController = self.navigationController else { return }
                            Presenter.App.showSettings(on: navigationController)
                        }
                    )
                ]
            )
        ]
    }
    
    private var fakeLibraryData: [TrackTableRow] {
        [
            .init(id: "1", text: "Abayo Stevens", detail: "Kathmandu"),
            .init(id: "2", text: "Alexa Tenorio", detail: "Tianjin"),
            .init(id: "3", text: "Samuil Sadovsky", detail: "Riga"),
            .init(id: "4", text: "Chineze Uchechey", detail: "Halifax"),
        ]
    }
}
