//
//  ViewController.swift
//  BubbleView
//
//  Created by Theo on 2024/8/27.
//

import UIKit
import SnapKit
let DESIGN_WIDTH: CGFloat = 750.0
func LAZSAO750(_ value: CGFloat) -> CGFloat {
    return value * (UIScreen.main.bounds.size.width / DESIGN_WIDTH)
}

class ViewController: UIViewController {
    var bubbleView: CustomBubbleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let bubbleView = CustomBubbleView(frame: .zero)
        self.bubbleView = bubbleView
        self.view.addSubview(self.bubbleView)
        
        let colors: [CGColor] = [
            UIColor(red: 255/255.0, green: 243/255.0, blue: 251/255.0, alpha: 1.0).cgColor,
            UIColor(red: 255/255.0, green: 242/255.0, blue: 248/255.0, alpha: 1.0).cgColor,
            UIColor(red: 255/255.0, green: 242/255.0, blue: 248/255.0, alpha: 1.0).cgColor,
            UIColor(red: 255/255.0, green: 229/255.0, blue: 238/255.0, alpha: 1.0).cgColor
        ]
        let titleExtend = [
            ["bold": "true", "color": "#595F6D", "text": "Fresh arrivals! Buy 3 get ", "textSize": 11],
            ["bold": "true", "color": "#FE4960", "text": "20% off", "textSize": 11],
            ["bold": "true", "color": "#595F6D", "text": " with free shipping!", "textSize": 11]
        ]
        let model = BubbleModel(borderLineSize: LAZSAO750(2.0), width: LAZSAO750(510.0), height: LAZSAO750(114.0), trianglePosition: (LAZSAO750(100.0)), triangleHeight: LAZSAO750(12.0), triangleWidth: LAZSAO750(26.0), titleExtend: titleExtend, cornerRadius: LAZSAO750(18.0), borderLineColor: UIColor(red: 255/255.0, green: 198/255.0, blue: 221/255.0, alpha: 1.0), contentColors: colors)
        
        let viewModel = BubbleViewModel(model: model)
        self.bubbleView.bindViewModel(viewModel)
        
        self.bubbleView.snp.makeConstraints { (make) in
            make.width.equalTo(viewModel.model.width)
            make.height.equalTo(viewModel.model.height)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-32.0)
        }
    }


}

