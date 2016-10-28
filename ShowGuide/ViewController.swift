//
//  ViewController.swift
//  ShowGuide
//
//  Created by Wayne Rumble on 19/08/2016.
//  Copyright © 2016 Wayne Rumble. All rights reserved.
//

import UIKit
import OAStackView
import SnapKit

public class ShowGuideViewController: UIViewController {
    
    lazy var stackView: OAStackView = {
        let stackView = OAStackView()
        stackView.axis = .Vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .FillEqually
        return stackView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        ShowGuideItem.all { showGuideItems in
            showGuideItems.forEach(self.viewForShowGuideItem)
        }
        
        view.addSubview(stackView)
        
        stackView.snp_makeConstraints { make in
            make.edges.equalTo(view.snp_edges)
        }
    }
    
    private func viewForShowGuideItem(showGuideItem: ShowGuideItem) {
        let view = ShowGuideItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bind(showGuideItem)
        view.tapped = { _ in
            print("Open \(showGuideItem.url)")
        }
        stackView.addArrangedSubview(view)
    }
    
    
}