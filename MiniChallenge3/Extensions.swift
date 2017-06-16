//
//  Extensions.swift
//  MiniChallenge3
//
//  Created by Erick Borges on 10/06/17.
//  Copyright © 2017 Guilherme Paciulli. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension String {
    public func isValid() -> Bool {
        return !(self.isEmpty || self.trimmingCharacters(in: .whitespaces).isEmpty)
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

extension UIImage {
    var bwImage: UIImage? {
        guard let cgImage = cgImage,
            let bwContext = bwContext else {
                return nil
        }
        
        let rect = CGRect(origin: .zero, size: size)
        bwContext.draw(cgImage, in: rect)
        let bwCgImage = bwContext.makeImage()
        
        return bwCgImage.flatMap { UIImage(cgImage: $0) }
    }
    
    private var bwContext: CGContext? {
        let bwContext = CGContext(data: nil,
                                  width: Int(size.width * scale),
                                  height: Int(size.height * scale),
                                  bitsPerComponent: 8,
                                  bytesPerRow: Int(size.width * scale),
                                  space: CGColorSpaceCreateDeviceGray(),
                                  bitmapInfo: CGImageAlphaInfo.none.rawValue)
        
        bwContext?.interpolationQuality = .high
        bwContext?.setShouldAntialias(false)
        
        return bwContext
    }
}

extension UIPageViewController {
    
    public var scrollView: UIScrollView? {
        for view in self.view.subviews {
            if let scrollView = view as? UIScrollView {
                return scrollView
            }
        }
        return nil
    }
    
}
