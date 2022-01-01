import UIKit
import SparrowKit

class RootSceneDelegate: BaseSceneDelegate {

    override func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        #if targetEnvironment(macCatalyst)
        windowScene.titlebar?.titleVisibility = .hidden
        #endif
        makeKeyAndVisible(in: windowScene, createViewControllerHandler: {
            return Navigation.rootController
        }, tint: UserSettings.tint)
    }
}

