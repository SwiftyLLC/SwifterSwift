// UIWindowExtensions.swift - Copyright 2024 SwifterSwift

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - Methods

public extension UIWindow {
    /// SwifterSwift: Switch current root view controller with a new view controller.
    ///
    /// - Parameters:
    ///   - viewController: new view controller.
    ///   - animated: set to true to animate view controller change (default is true).
    ///   - duration: animation duration in seconds (default is 0.5).
    ///   - options: animation options (default is .transitionFlipFromRight).
    ///   - completion: optional completion handler called after view controller is changed.
    func switchRootViewController(
        to viewController: UIViewController,
        animated: Bool = true,
        duration: TimeInterval = 0.5,
        options: UIView.AnimationOptions = .transitionFlipFromRight,
        _ completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            completion?()
            return
        }

        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
}

#endif

#if canImport(Foundation)

import Foundation

// swiftlint:disable first_where
public extension UIWindow {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }

    /// Filter for any scenes that are attached, regardless of state (i.e. active, inactive and background)
    static var attachedKeyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState != .unattached }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }

    static var isLandscape: Bool {
        interfaceOrientation?
            .isLandscape ?? false
    }

    static var isPortrait: Bool {
        interfaceOrientation?
            .isPortrait ?? false
    }

    static var interfaceOrientation: UIInterfaceOrientation? {
        keyWindow?.windowScene?.interfaceOrientation
    }

    static var statusBarHeight: CGFloat {
        keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}


#endif
