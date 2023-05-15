//
//  SCEdgeView.swift
//  SoundCore
//
//  Created by anker on 2022/12/15.
//  Copyright © 2022 team. All rights reserved.
//

import UIKit

/// 用一个view包住需要展示的view  这可以设置内边距的方法来控制跟随子view变大变小
class SCEdgeView<T: UIView>: UIView {

    // MARK: Lifecycle

    init(contentView: T) {
        self.contentView = contentView
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        contentView = T(frame: frame)
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal

    let contentView: T

    // MARK: Private

    private func setup() {
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(snp.topMargin)
            make.leading.equalTo(snp.leadingMargin)
            make.trailing.equalTo(snp.trailingMargin)
            make.bottom.equalTo(snp.bottomMargin)
        }
    }
}
