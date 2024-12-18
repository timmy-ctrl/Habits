import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let introductionPageViewController = IntroductionPageViewController()
        let mainViewController = IntroductionFirstPageViewController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(
            rootViewController: IntroductionPageViewController(
                transitionStyle: .scroll,
                navigationOrientation: .horizontal,
                options: nil
            )
        )
        window?.makeKeyAndVisible()
    }
}

