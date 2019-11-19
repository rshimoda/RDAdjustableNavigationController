//
//  RDAdjustableNavigationController.swift
//
//
//  Created by Sergi on 19/11/2019.
//

import UIKit

public class RDAdjustableNavigationController: UINavigationController {
    
    private var defaultNavigationBarHeight: CGFloat {
        return customNavBar?.defaultHeight ?? 44.0
    }
    private var _navigationBarHeight: CGFloat?
    
    // MARK: -
    
    /// Navigation bar content (bar items, title etc) alignment.
    public var contentVerticalAlignment: RDAdjustableNavigationBarContentAlignment {
        get {
            return customNavBar?.contentVerticalAlignment ?? .middle
        }
        set {
            customNavBar?.contentVerticalAlignment = newValue
        }
    }
    
    /// Height of navigation bar. Use this property to change it. Animatable.
    public var navigationBarHeight: CGFloat {
        get {
            return _navigationBarHeight ?? defaultNavigationBarHeight
        }
        set {
            guard _navigationBarHeight != newValue else {
                return
            }
            
            _navigationBarHeight = newValue
            customNavBar?.customHeight = newValue
            
            let topAdditionalSafeAreaInset = max(0.0, newValue - defaultNavigationBarHeight)
            self.additionalSafeAreaInsets = .init(top: topAdditionalSafeAreaInset, left: 0.0, bottom: 0.0, right: 0.0)
        }
    }
    
    private var customNavBar: RDAdjustableNavigationBar? {
        return navigationBar as? RDAdjustableNavigationBar
    }
    
    // MARK: -
    
    public override init(rootViewController: UIViewController) {
        super.init(navigationBarClass: RDAdjustableNavigationBar.self, toolbarClass: UIToolbar.self)
        viewControllers = [rootViewController]
    }
    
    @available(swift, obsoleted: 1.0, message: "use `init(rootViewController:)` instead")
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        fatalError("init(navigationBarClass:toolbarClass:) has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let customNavBar = customNavBar else {
            return
        }
        
        customNavBar.topOffset = customNavBar.preferredTopOffset
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let customNavBar = customNavBar else {
            return
        }
        
        let navigationBarFrame = customNavBar.frame
        let navigationBarTopOffset = customNavBar.topOffset
        navigationBar.frame = .init(x: navigationBarFrame.minX, y: navigationBarTopOffset, width: navigationBarFrame.width, height: navigationBarHeight)
    }
}
