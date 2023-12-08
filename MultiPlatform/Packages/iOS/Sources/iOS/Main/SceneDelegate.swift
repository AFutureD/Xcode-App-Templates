// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    public var window: UIWindow?
    
    public func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Unexpected type of scene: \(type(of: scene))")
        }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
    }
}

private extension SceneDelegate {
    private func makeRootViewController() -> UIViewController {
        let mainViewController = RootViewController()
        
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationController.navigationBar.compactAppearance = navigationBarAppearance
        navigationController.navigationBar.compactAppearance = navigationBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        return navigationController
    }
}
