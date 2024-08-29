//
//  BubbleModel.swift
//  BubbleView
//
//  Created by Theo on 2024/8/27.
//

import Foundation
import UIKit
class BubbleModel: NSObject {
    var borderLineSize: CGFloat = 0
    var width: CGFloat = 0
    var height: CGFloat = 0
    var trianglePosition: CGFloat = 0
    var triangleHeight: CGFloat = 0
    var triangleWidth: CGFloat = 0
    var title: String?
    var titleExtend: [Any] = []
    var cornerRadius: CGFloat = 0
    var borderLineColor: UIColor?
    var contentColors: [CGColor] = []

    init(borderLineSize: CGFloat, width: CGFloat, height: CGFloat, trianglePosition: CGFloat, triangleHeight: CGFloat, triangleWidth: CGFloat, titleExtend: [Any], cornerRadius: CGFloat, borderLineColor: UIColor, contentColors: [CGColor]) {
        super.init()
        self.borderLineSize = borderLineSize
        self.width = width
        self.height = height
        self.trianglePosition = trianglePosition
        self.triangleWidth = triangleWidth
        self.triangleHeight = triangleHeight
        self.titleExtend = titleExtend
        self.cornerRadius = cornerRadius
        self.borderLineColor = borderLineColor
        self.contentColors = contentColors
    }
}
