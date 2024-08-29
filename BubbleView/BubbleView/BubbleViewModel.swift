//
//  BubbleViewModel.swift
//  BubbleView
//
//  Created by Theo on 2024/8/27.
//

import Foundation

class BubbleViewModel: NSObject {
    var model: BubbleModel
    
    init(model: BubbleModel) {
        self.model = model
        super.init()
    }
}
