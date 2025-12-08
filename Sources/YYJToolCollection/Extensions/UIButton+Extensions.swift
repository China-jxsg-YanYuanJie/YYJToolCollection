//
//  UIButton+Extensions.swift
//  EMCPlayer
//
//  Created by Claude on 2024/12/08.
//  Copyright © 2024 EMC Player. All rights reserved.
//

import UIKit
import ObjectiveC

// MARK: - UIButton Extensions

/// 为按钮添加一个block的点击方式回调
public extension UIButton {

    // MARK: - Public Types

    public typealias BtnAction = (UIButton) -> Void

    // MARK: - Private Types

    ///  给button添加一个属性 用于记录点击tag
    private enum AssociatedKeys {
        static var actionKey = "actionKey"
        static var actionKeyPointer = UnsafeRawPointer(UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 1))
    }

    // MARK: - Properties

    @objc dynamic override var actionDic: NSMutableDictionary? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.actionKeyPointer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get {
            if let dic = objc_getAssociatedObject(self, AssociatedKeys.actionKeyPointer) as? NSDictionary {
                return NSMutableDictionary(dictionary: dic)
            }
            return nil
        }
    }

    // MARK: - Public Methods

    /**
     * 添加TouchUpInside事件的block回调
     * @param action 点击回调
     * @return 返回自身，支持链式调用
     */
    @discardableResult
    public func addTouchUpInSideBtnAction(_ action: @escaping BtnAction) -> UIButton {
        DIY_button_add(action: action, for: .touchUpInside)
        return self
    }

    /**
     * 添加TouchUpOutside事件的block回调
     * @param action 点击回调
     * @return 返回自身，支持链式调用
     */
    @discardableResult
    public func addTouchUpOutSideBtnAction(_ action: @escaping BtnAction) -> UIButton {
        DIY_button_add(action: action, for: .touchUpOutside)
        return self
    }

    // MARK: - Private Methods

    /**
     * 内部方法：添加事件回调
     */
    @objc
    private dynamic func DIY_button_add(action: @escaping BtnAction, for controlEvents: UIControl.Event) {
        let eventStr = NSString(string: String(describing: controlEvents.rawValue))
        if let actions = actionDic {
            actions.setObject(action, forKey: eventStr)
            actionDic = actions
        } else {
            actionDic = NSMutableDictionary(object: action, forKey: eventStr)
        }
        switch controlEvents {
        case .touchUpInside:
            addTarget(self, action: #selector(touchUpInSideBtnAction), for: .touchUpInside)
        case .touchUpOutside:
            addTarget(self, action: #selector(touchUpOutSideBtnAction), for: .touchUpOutside)
        default:
            break
        }
    }

    /**
     * TouchUpInside事件处理器
     */
    @objc
    private dynamic func touchUpInSideBtnAction() {
        if let action = actionDic?.object(forKey: String(describing: UIControl.Event.touchUpInside.rawValue)) as? BtnAction {
            action(self)
        }
    }

    /**
     * TouchUpOutside事件处理器
     */
    @objc
    private dynamic func touchUpOutSideBtnAction() {
        if let action = actionDic?.object(forKey: String(describing: UIControl.Event.touchUpOutside.rawValue)) as? BtnAction {
            action(self)
        }
    }
}
