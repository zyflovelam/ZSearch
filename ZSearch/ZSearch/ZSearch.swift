//
//  ZSearch.swift
//  ZSearch
//
//  Created by Zyf on 2019/7/8.
//  Copyright © 2019 Zyf. All rights reserved.
//

import UIKit
import SnapKit

@objc enum ZSearchBarIconDirection: Int {
    case left = 1
    case right = 0
}

class ZSearchBar: UIView {
    
    var appearanceDelegate: ZSearchBarAppearanceDelegate! {
        didSet{
            reloadUI()
        }
    }
    
    private var backgrounView: UIView!
    private var tipLabel: UILabel!
    private var iconImageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initUI()
    }
}

extension ZSearchBar {
    private func initUI() {
        self.backgrounView = UIView()
        self.addSubview(self.backgrounView)
        self.backgrounView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        self.tipLabel = UILabel()
        self.addSubview(self.tipLabel)
        self.tipLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.iconImageView = UIImageView()
        self.addSubview(iconImageView)
        self.iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    private func reloadUI() {
        guard self.appearanceDelegate != nil else {
            return
        }
        
        self.backgrounView.layer.cornerRadius = appearanceDelegate!.zSearchBar?(cornerRadius: self) ?? 0
        self.backgrounView.backgroundColor = appearanceDelegate!.zSearchBar?(backgroundColor: self) ?? UIColor.init(named: "backgroundDefault")
        self.tipLabel.text = appearanceDelegate!.zSearchBar?(title: self) ?? "Search"
        // MARK: - 设置皮肤
        
    }
}

extension ZSearchBar {
    
}

@objc protocol ZSearchBarAppearanceDelegate {
    @objc optional func zSearchBar(cornerRadius for: ZSearchBar) -> CGFloat
    @objc optional func zSearchBar(backgroundColor for: ZSearchBar) -> UIColor
    @objc optional func zSearchBar(icon for: ZSearchBar) -> UIImage
    @objc optional func zSearchBar(title for: ZSearchBar) -> String
    @objc optional func zSearchBar(iconDirection for: ZSearchBar) -> ZSearchBarIconDirection
}
