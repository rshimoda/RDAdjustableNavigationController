//
//  RDAdjustableNavigationBar.swift
//  
//
//  Created by Sergi on 19/11/2019.
//

import UIKit

internal class RDAdjustableNavigationBar: UINavigationBar {
    
    var useSystemHeight = true {
        didSet {
            guard oldValue != useSystemHeight else {
                return
            }
            setNeedsLayout()
        }
    }
    
    var contentVerticalAlignment: RDAdjustableNavigationBarContentAlignment = .middle {
        didSet {
            guard oldValue != contentVerticalAlignment else {
                return
            }
            setNeedsLayout()
        }
    }
    
    var defaultHeight: CGFloat {
        guard let window = self.window else {
            return 44.0
        }
        
        let defaultSizeThatFits = super.sizeThatFits(window.bounds.size)
        return defaultSizeThatFits.height
    }
    
    var customHeight: CGFloat = 44.0 {
        didSet {
            guard oldValue != customHeight else {
                return
            }
            setNeedsLayout()
        }
    }
    
    var preferredTopOffset: CGFloat {
        let topOffset: CGFloat
        
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = window?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
        }
        else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        
        if let superview = superview,
            let superviewFrameInWindowCoordinates = window?.convert(superview.bounds, from: superview) {
            topOffset = superviewFrameInWindowCoordinates.intersects(statusBarFrame) ? statusBarFrame.height : 0.0
        }
        else {
            topOffset = 0.0
        }
        
        return topOffset
    }
    
    var topOffset: CGFloat = 0.0 {
        didSet {
            guard oldValue != topOffset else {
                return
            }
            setNeedsLayout()
        }
    }
    
    // MARK: -
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let defaultValue = super.sizeThatFits(size)
        
        guard useSystemHeight == false else {
            return defaultValue
        }
        
        let width = self.window?.bounds.width ?? defaultValue.width
        let height = customHeight
        
        return CGSize(width: width, height: height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard useSystemHeight == false else {
            return
        }
        
        let defaultHeight = self.defaultHeight
        
        for subview in self.subviews {
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            
            if stringFromClass.contains("BarBackground") {
                subview.frame = CGRect(x: subview.frame.minX, y: -topOffset, width: bounds.width, height: customHeight + topOffset)
            }
            else if stringFromClass.contains("BarContent") {
                let barContentViewMinY: CGFloat
                let barContentHeight: CGFloat
                
                switch contentVerticalAlignment {
                case .top:
                    barContentViewMinY = 0.0
                    barContentHeight = customHeight
                    
                case .middle:
                    barContentViewMinY = (customHeight - defaultHeight) / 2.0
                    barContentHeight = defaultHeight
                    
                case .bottom:
                    barContentViewMinY = customHeight - defaultHeight
                    barContentHeight = defaultHeight
                }
                
                subview.frame = CGRect(x: subview.frame.minX, y: barContentViewMinY, width: subview.bounds.width, height: barContentHeight)
            }
        }
    }
}
