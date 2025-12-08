//
//  UIView+Extensions.swift
//  EMCPlayer
//
//  Created by Claude on 2024/12/08.
//  Copyright © 2024 EMC Player. All rights reserved.
//

import UIKit
import ObjectiveC

// MARK: - UIView Extensions

/// 给view添加一个可以直接添加单击的block形式
public extension UIView {

    // MARK: - Public Types

    typealias ButtonAction = (_ sender: UIView?) -> Void

    // MARK: - Private Types

    /// 用于关联对象的键
    private enum AssociatedKeys {
        static var actionKey = "actionKey"
        static var actionKeyPointer = UnsafeRawPointer(UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 1))
    }

    // MARK: - Properties

    @objc dynamic var actionDic: NSMutableDictionary? {
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
     * 添加点击手势回调
     * @param action 点击回调
     */
    @objc
    public dynamic func addTouchAction(action: @escaping ButtonAction) {
        let eventStr = NSString(string: "tapKey")
        if let actions = actionDic {
            actions.setObject(action, forKey: eventStr as NSCopying)
            actionDic = actions
        } else {
            actionDic = NSMutableDictionary(object: action, forKey: eventStr as NSCopying)
        }

        // 添加手势识别器
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGesture)
    }

    // MARK: - Private Methods

    /**
     * 点击手势处理器
     */
    @objc
    private dynamic func tapAction(_ tap: UITapGestureRecognizer) {
        if let touchUpInSideAction = actionDic?.object(forKey: String(describing: "tapKey")) as? ButtonAction {
            touchUpInSideAction(tap.view)
        }
    }
}
