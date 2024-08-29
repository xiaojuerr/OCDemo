//
//  CustomBubbleView.swift
//  BubbleView
//
//  Created by Theo on 2024/8/27.
//

import Foundation
import SnapKit


let LAZSAO750 = { (value: CGFloat) -> CGFloat in
    return value * (UIScreen.main.bounds.size.width / DESIGN_WIDTH)
}

class CustomBubbleView: UIView {
    var viewModel: BubbleViewModel?
        
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
        
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.white.cgColor
        layer.strokeColor = UIColor.white.cgColor
        return layer
    }()
        
    private lazy var gradientContentLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.mask = shapeLayer
        return layer
    }()
        
    private lazy var borderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView() {
        addSubview(label)
        addSubview(leftImageView)
        
        layer.insertSublayer(gradientContentLayer, at: 0)
        layer.addSublayer(borderLayer)
    }
            
    func bindViewModel(_ viewModel: BubbleViewModel) {
        self.viewModel = viewModel
        
        let attributedString = NSMutableAttributedString()
        if let titleExtend = self.viewModel?.model.titleExtend as? [[String: Any]] {
            for dict in titleExtend {
                if let text = dict["text"] as? String,
                    let colorString = dict["color"] as? String,
                    let textColor = UIColor.lazColor(hex: colorString) {
                    
                    var font = UIFont.systemFont(ofSize: LAZSAO750(24.0))
                    if let isBold = dict["bold"] as? String, isBold == "true" {
                        font = UIFont.boldSystemFont(ofSize: LAZSAO750(22.0))
                    }
                        
                    let attributes: [NSAttributedString.Key: Any] = [
                        .font: font,
                        .foregroundColor: textColor
                    ]
                        
                    let attributedText = NSAttributedString(string: text, attributes: attributes)
                    attributedString.append(attributedText)
                }
            }
        }
        self.label.numberOfLines = 2
        self.label.attributedText = attributedString
            
        self.borderLayer.strokeColor = self.viewModel?.model.borderLineColor?.cgColor
        self.borderLayer.lineWidth = self.viewModel?.model.borderLineSize ?? 2.0
        self.leftImageView.image = UIImage(named: "Image-1614")
            
        self.setupLayer()
        self.setupLayout()
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        shapeLayer.path = createPath().cgPath
        gradientContentLayer.frame = bounds
        borderLayer.path = shapeLayer.path
    }
        
    private func setupLayer() {
        gradientContentLayer.colors = viewModel?.model.contentColors
        gradientContentLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientContentLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            
        gradientContentLayer.locations = [0.0, 0.4, 0.7, 1.0]
        
        //borderLayer.path = shapeLayer.path
        borderLayer.fillColor = UIColor.clear.cgColor
    }
        
    private func setupLayout() {
        guard let viewModel = viewModel else {return }
        leftImageView.snp.remakeConstraints { make in
            make.height.equalTo(self.snp.height).offset(-LAZSAO750(12.0 + 12.0) - (viewModel.model.triangleHeight))
            make.width.equalTo(leftImageView.snp.height)
            make.left.equalTo(self).offset(LAZSAO750(12.0))
            make.top.equalTo(self).offset(LAZSAO750(12.0))
        }
            
        label.snp.remakeConstraints { make in
            make.right.equalTo(self).offset(-LAZSAO750(36.0))
            make.left.equalTo(leftImageView.snp.right).offset(LAZSAO750(12.0))
            make.top.equalTo(leftImageView).offset(LAZSAO750(8.0))
            make.bottom.equalTo(leftImageView).offset(-LAZSAO750(8.0))
        }
    }

    private func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        guard let viewModel = viewModel else { return path }
            
        let cornerRadius = viewModel.model.cornerRadius
        let triangleHeight = viewModel.model.triangleHeight
        let triangleWidth = viewModel.model.triangleWidth
        let trianglePosition = viewModel.model.trianglePosition
            
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        path.addLine(to: CGPoint(x: bounds.size.width - cornerRadius, y: 0))
            
        // Right Top Corner
        path.addArc(withCenter: CGPoint(x: bounds.size.width - cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: .pi * 3 / 2,
                    endAngle: 0,
                    clockwise: true)
            
        // Right Side
        path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height - cornerRadius - triangleHeight))
            
        // Right Bottom Corner
        path.addArc(withCenter: CGPoint(x: bounds.size.width - cornerRadius, y: bounds.size.height - cornerRadius - triangleHeight),
                    radius: cornerRadius,
                    startAngle: 0,
                    endAngle: .pi / 2,
                    clockwise: true)
            
        // Bottom Side
        path.addLine(to: CGPoint(x: trianglePosition + triangleWidth, y: bounds.size.height - triangleHeight))
            
        // Triangle
        path.addLine(to: CGPoint(x: trianglePosition + triangleWidth / 2, y: bounds.size.height))
        path.addLine(to: CGPoint(x: trianglePosition, y: bounds.size.height - triangleHeight))
        path.addLine(to: CGPoint(x: cornerRadius, y: bounds.size.height - triangleHeight))
            
        // Left Bottom Corner
        path.addArc(withCenter: CGPoint(x: cornerRadius, y: bounds.size.height - cornerRadius - triangleHeight),
                    radius: cornerRadius,
                    startAngle: .pi / 2,
                    endAngle: .pi,
                    clockwise: true)
            
            // Left Side
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
            
            // Left Top Corner
        path.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: .pi,
                    endAngle: .pi * 3 / 2,
                    clockwise: true)
            
        path.close()
        return path
    }
}
