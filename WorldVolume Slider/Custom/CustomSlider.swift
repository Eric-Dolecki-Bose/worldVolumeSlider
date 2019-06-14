//
//  CustomSlider.swift
//  WorldVolume Slider
//
//  Created by Eric Dolecki on 10/3/18.
//  Copyright © 2018 Eric Dolecki. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {

    public var pos1:  UIView!
    public var pos2:  UIView!
    public var pos3:  UIView!
    public var pos4:  UIView!
    public var pos5:  UIView!
    public var pos6:  UIView!
    public var pos7:  UIView!
    public var pos8:  UIView!
    public var pos9:  UIView!
    public var pos10: UIView!
    public var pos11: UIView!
    var positionDots: [UIView]!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        pos1 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos1.backgroundColor = UIColor(hex: 0x000000)
        pos1.layer.cornerRadius = 2
        pos1.center = CGPoint(x: 9, y: 15)
        
        pos2 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos2.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos2.layer.cornerRadius = 2
        pos2.center = CGPoint(x: 9 + 30.25, y: 15)
        
        pos3 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos3.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos3.layer.cornerRadius = 2
        pos3.center = CGPoint(x: pos2.center.x + 30.25, y: 15)
        
        pos4 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos4.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos4.layer.cornerRadius = 2
        pos4.center = CGPoint(x: pos3.center.x + 30.25, y: 15)
        
        pos5 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos5.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos5.layer.cornerRadius = 2
        pos5.center = CGPoint(x: pos4.center.x + 29.5, y: 15)
        
        pos6 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos6.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos6.layer.cornerRadius = 2
        pos6.center = CGPoint(x: pos5.center.x + 30, y: 15)
        
        pos7 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos7.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos7.layer.cornerRadius = 2
        pos7.center = CGPoint(x: pos6.center.x + 30, y: 15)
        
        pos8 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos8.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos8.layer.cornerRadius = 2
        pos8.center = CGPoint(x: pos7.center.x + 30, y: 15)
        
        pos9 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos9.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos9.layer.cornerRadius = 2
        pos9.center = CGPoint(x: pos8.center.x + 30, y: 15)
        
        pos10 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos10.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos10.layer.cornerRadius = 2
        pos10.center = CGPoint(x: pos9.center.x + 30, y: 15)
        
        pos11 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        pos11.backgroundColor = UIColor(hex: 0xCCCCCC)
        pos11.layer.cornerRadius = 2
        pos11.center = CGPoint(x: pos10.center.x + 30, y: 15)
        
        //pos12 = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        //pos12.backgroundColor = UIColor(hex: 0xCCCCCC)
        //pos12.layer.cornerRadius = 2
        //pos12.center = CGPoint(x: pos11.center.x + 31, y: 15)
        
        /// This is a hack but only have 1, 6, and 12 available as favorites.
        pos2.isHidden = true
        pos3.isHidden = true
        pos4.isHidden = true
        pos5.isHidden = true
        pos7.isHidden = true
        pos8.isHidden = true
        pos9.isHidden = true
        pos10.isHidden = true
        
        self.addSubview(pos1)
        self.addSubview(pos2)
        self.addSubview(pos3)
        self.addSubview(pos4)
        self.addSubview(pos5)
        self.addSubview(pos6)
        self.addSubview(pos7)
        self.addSubview(pos8)
        self.addSubview(pos9)
        self.addSubview(pos10)
        self.addSubview(pos11)
        //self.addSubview(pos12)
        
        //positionDots = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10, pos11, pos12]
        positionDots = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10, pos11]
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
