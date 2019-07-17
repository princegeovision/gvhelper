//
//  VersionInfoView.swift
//  gvhelper
//
//  Created by geovision on 2019/7/17.
//

import UIKit

enum Version {
    static let icsWidth :CGFloat = 200.0
    static let icsHeight :CGFloat = 40.0
    static let labelHeight :CGFloat = 20.0
}
class VersionInfoView: UIView {

    private var isSetup : Bool = false
    //private let topLabel:UILabel = UILabel()
    @IBOutlet weak var topLabel : UILabel!

    //MARK: Initializers
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.setupControls()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.setupControls()
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        //self.type = self.useForEmail ? .Email : .Password
        self.setupControls()
    }
    override var intrinsicContentSize: CGSize {
        
        return CGSize(width: Version.icsWidth, height: Version.icsHeight)
    }
    
    //MARK: UI Methods
    private func setupControls()
    {
        if isSetup == false , topLabel != nil {
            self.backgroundColor = UIColor.white
            //self.addSubview(self.topLabel)
            let frame = CGRect(x: 0, y: self.boundsHeight/2, width: self.boundsWidth, height: Version.labelHeight)
            self.topLabel.frame = frame
            self.topLabel.alpha = 1.0
            self.topLabel.text = String("Version=\(GvHelper.hp.version)")
            self.topLabel.textAlignment = .center
            self.topLabel.textColor = UIColor.black
            self.topLabel.font = UIFont.systemFont(ofSize: 17)
            isSetup = true
        }
    }
    
    
    //MARK: Invalid Input Animation
    private func animateInvalidEmailInput()
    {
        self.topLabel.textColor = UIColor.red
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.topLabel.textColor = UIColor.lightGray
        }
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.fromValue = NSValue(cgPoint: CGPoint(x:self.topLabel.centerX - 8, y:self.topLabel.centerY))
        animation.toValue = NSValue(cgPoint: CGPoint(x:self.topLabel.centerX + 8, y:self.topLabel.centerY))
        animation.repeatCount = 5
        animation.autoreverses = true
        self.topLabel.layer.add(animation, forKey: "position")
        
        CATransaction.commit()
    }
    

}
