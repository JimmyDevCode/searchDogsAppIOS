//
//  Extensions.swift
//  Search Dogs
//
//  Created by Jimmy Ronaldo Macedo Pizango on 1/08/23.
//

import Foundation
import UIKit

extension String {
    func removeWordFromText(inputText: String, textToReplace: String) -> String {
        var wordResult = inputText.replacingOccurrences(of: textToReplace, with: "")
        wordResult = wordResult.trimmingCharacters(in: .whitespaces)
        return wordResult
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11, *){
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
        }else{
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
        
    }
    
    func addShadow(shadowColor: UIColor = .black,
                   shadowOpacity: Float = 0.5,
                   shadowOffset: CGSize = CGSize(width: 2, height: 2),
                   shadowRadius: CGFloat = 4.0) {
        
        // Configura la sombra
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
