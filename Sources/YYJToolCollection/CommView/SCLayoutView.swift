//
//  SCcccView.swift
//  SoundCore
//
//  Created by anker on 2022/12/15.
//  Copyright © 2022 team. All rights reserved.
//

import UIKit

/// 默认配置view  是一个滚动视图 用于过长内容可以滑动 子view是一个StackView 外部决定他的排版顺序
public class SCLayoutView: UIScrollView {

    // MARK: Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .fill
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public

    public let stackView = UIStackView()

    
    public func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
    public func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(stackView.addArrangedSubview)
    }
    
    public func addBlankFill() {
        let view = UIView()
        
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 0), for: .horizontal)
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 0), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 0), for: .horizontal)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 0), for: .vertical)
        stackView.addArrangedSubview(view)
    }
    
    public func disEnableVerticalScroll() {
        stackView.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
    }
    
    public func disEnableHorizontalScroll() {
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }

}
