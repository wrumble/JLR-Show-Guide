//
//  ShowGuideItemView.swift
//
//
//  Created by Wayne Rumble on 18/08/2016.
//
//

import UIKit
import OAStackView
import SnapKit

class ShowGuideItemView: UIView {
    
    var nameLabel: UILabel!
    var textBody: UITextView!
    var chevronIconImageView: UIImageView!
    var iconImageView: UIImageView!
    var backGroundImageView: UIImageView!
    var itemSubView: OAStackView!
    var tapped: (ShowGuideItemView) -> () = { _ in }
    private var touched = false
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(item: ShowGuideItem) {
        nameLabel.text = item.name
        textBody.text = item.text
        iconImageView.image = UIImage(named: item.iconFileName)
        backGroundImageView.image = UIImage(named: item.backgroundImageFileName)
        chevronIconImageView.image = UIImage(named: item.chevronIconImageFileName)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touched = true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touched {
            touched = false
            tapped(self)
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        touched = false
    }
    
    func setupSubviews() {
        
        itemSubView = OAStackView(frame: CGRect.zero)
        nameLabel = UILabel(frame: CGRect.zero)
        textBody = UITextView(frame: CGRect.zero)
        iconImageView = UIImageView(frame: CGRect.zero)
        backGroundImageView = UIImageView(frame: CGRect.zero)
        chevronIconImageView = UIImageView(frame: CGRect.zero)
        
        itemSubView.axis = .Vertical
        itemSubView.distribution = .EqualCentering
        itemSubView.alignment = .Center
        itemSubView.backgroundColor = UIColor.blueColor()
        
        itemSubView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        textBody.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        backGroundImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textBody.backgroundColor = UIColor.clearColor()
        textBody.textAlignment = .Center
        textBody.scrollEnabled = false
        
        addSubview(backGroundImageView)
        addSubview(chevronIconImageView)
        addSubview(itemSubView)
        itemSubView.addArrangedSubview(iconImageView)
        itemSubView.addArrangedSubview(nameLabel)
        itemSubView.addArrangedSubview(textBody)
        
        chevronIconImageView.snp_makeConstraints { make in
            make.centerY.equalTo(snp_centerY)
            make.trailing.equalTo(snp_trailing).inset(15)
            make.height.equalTo(snp_height).multipliedBy(0.135)
            make.width.equalTo(chevronIconImageView.snp_height)
        }
        
        
        iconImageView.snp_makeConstraints { make in
            make.width.equalTo(snp_width).multipliedBy(0.15)
            make.height.equalTo(iconImageView.snp_width)
        }
        
        textBody.snp_makeConstraints { make in
            make.width.equalTo(snp_width).multipliedBy(0.75)
        }
        
        backGroundImageView.snp_makeConstraints { make in
            make.edges.equalTo(snp_edges)
        }
        
        itemSubView.snp_makeConstraints { make in
            make.center.equalTo(snp_center)
        }

    }
}
