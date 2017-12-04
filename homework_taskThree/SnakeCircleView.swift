//
//  snakeCircleView.swift
//  homework_taskThree
//
//  Created by Lab122-09 on 12/2/17.
//  Copyright © 2017 Lab122-09. All rights reserved.
//

import UIKit

class SnakeCircleView: UIView
{
    var numOfSnakes: Int?
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        self.backgroundColor = UIColor.clear
    }
    
    init(frame: CGRect, numOfSnakes: Int)
    {
        self.numOfSnakes = numOfSnakes
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect)
    {
        let arcWidth: Int = 360 / numOfSnakes!
        
        var frc: CGFloat?
        var fgc: CGFloat?
        var fbc: CGFloat?
        
        for i in 0...numOfSnakes! - 1
        {
            let redC: CGFloat = randomNumber() / 256.0
            let greenC: CGFloat = randomNumber() / 256.0
            let blueC: CGFloat = randomNumber() / 256.0
            
            if i == 0
            {
                frc = redC
                fgc = greenC
                fbc = blueC
            }
            
            drawArc(arcCenter: CGPoint(x: rect.maxY, y: rect.maxY), lineWidth: 60, radius: rect.width * 1.5, startAngle: CGFloat(i) * degToRad(deg: arcWidth), endAngle: degToRad(deg: (i + 1) * arcWidth), color: UIColor(red: redC, green: greenC, blue: blueC, alpha: 1).cgColor, view: self)
        }
        
        drawArc(arcCenter: CGPoint(x: rect.maxY, y: rect.maxY), lineWidth: 60, radius: rect.width * 1.5, startAngle: 0.0, endAngle: degToRad(deg: 1), color: UIColor(red: frc!, green: fgc!, blue: fbc!, alpha: 1).cgColor, view: self)
        
        //Dosta amatiorsko izlygax pripokriwaneto na segmenti, no wajnoto e che raboti, haha.
        //I se izwinqwam za krokodilicata, nqmam kirilica na wirtualnata mashina.
    }
    
    func drawArc(arcCenter: CGPoint, lineWidth: CGFloat, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: CGColor?, view: UIView!)
    {
        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineCap = "round"
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func degToRad(deg: Int) -> CGFloat
    {
        return -CGFloat(deg) * CGFloat(Double.pi * 2) / 360.0
    }
    
    func randomNumber(range: ClosedRange<Int> = 0...255) -> CGFloat
    {
        let min = range.lowerBound
        let max = range.upperBound
        return CGFloat(Int(arc4random_uniform(UInt32(1 + max - min))) + min)
    }
}
