import UIKit
import SparrowKit
import NativeUIKit

open class HeaderHomeView: SPView {
    
    let addButton = NativeLargeActionButton().do {
        $0.set(
            title: "Import Files",
            icon: Images.Menu.add_circle_fill,
            colorise: .init(content: .tint, background: .custom(.init(hex: "E5F1FF")))
        )
        $0.higlightStyle = .content
        $0.addTarget(self, action: #selector(didTapImportFiles), for: .touchUpInside)
    }
    
    let footerAddButton = NativeFooterView(text: "You can import files from your documents and manage it files into playlists.")
    
    let playlistHeaderView = NativeLargeHeaderView().do {
        $0.titleLabel.text = "Playlists"
        $0.button.setTitle("See All")
        $0.button.addTarget(self, action: #selector(didTapSeeAllPlaylists), for: .touchUpInside)
    }
    
    let playlistCollectionView = PlaylistCollectionView()
    
    // MARK: - Private
    
    private var extendView = SPView()
    
    // MARK: - Init
    
    open override func commonInit() {
        super.commonInit()
        layoutMargins.bottom = NativeLayout.Spaces.default_double
        backgroundColor = .secondarySystemGroupedBackground
        addSubviews([extendView, addButton, footerAddButton, playlistHeaderView, playlistCollectionView])
    }
    
    // MARK: - Ovveride
    
    open override var backgroundColor: UIColor? {
        didSet {
            extendView.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        addButton.layout(y: layoutMargins.top)
        addButton.setXToSuperviewLeftMargin()
        footerAddButton.setWidthAndFit(width: addButton.frame.width)
        footerAddButton.frame.origin.x = addButton.frame.origin.x
        footerAddButton.frame.origin.y = addButton.frame.maxY + NativeLayout.Spaces.default_half
        playlistHeaderView.layout(y: footerAddButton.frame.maxY + NativeLayout.Spaces.default / 2)
        playlistCollectionView.setWidthAndFit(width: frame.width)
        playlistCollectionView.frame.origin.y = playlistHeaderView.frame.maxY + NativeLayout.Spaces.default_half / 2
        extendView.frame = .init(x: .zero, maxY: .zero, width: frame.width, height: 1000)

    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        layoutSubviews()
        return .init(width: frame.width, height: playlistCollectionView.frame.maxY + layoutMargins.bottom)
    }
    
    // MARK: - Actions
    
    @objc func didTapSeeAllPlaylists() {
        guard let navigationController = self.viewController?.navigationController else { return }
        Presenter.pushExample(on: navigationController)
    }
    
    @objc func didTapImportFiles() {
        guard let contorller = self.viewController else { return }
        Presenter.presentExample(on: contorller)
    }
}
