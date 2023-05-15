//
//  SCColumnView.swift
//  SoundCore
//
//  Created by anker on 2022/12/15.
//  Copyright © 2022 team. All rights reserved.
//

import UIKit

class SCColumnView: SCLayoutView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        stackView.axis = .vertical
        
        // 应该是上下滚动的情况  宽度和父视图一样  如果左右的话  高度就需要一样
        disEnableHorizontalScroll()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
