//
//  iMessageInputBar.swift
//  Example
//
//  Created by Nathan Tannar on 2018-06-06.
//  Copyright © 2018 Nathan Tannar. All rights reserved.
//

import UIKit
import InputBarAccessoryView

final class iMessageInputBar: InputBarAccessoryView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        inputTextView.textContainerInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 36)
        inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 36)
        if #available(iOS 13, *) {
            inputTextView.layer.borderColor = UIColor.systemGray2.cgColor
        } else {
            inputTextView.layer.borderColor = UIColor.lightGray.cgColor
        }
        inputTextView.layer.borderWidth = 1.0
        inputTextView.layer.cornerRadius = 16.0
        inputTextView.layer.masksToBounds = true
        inputTextView.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        inputTextView.font = .systemFont(ofSize: 20)
        setRightStackViewWidthConstant(to: 70, animated: false)
        setStackViewItems([InputBarButtonItem.fixedSpace(16), sendButton, InputBarButtonItem.fixedSpace(16)], forStack: .right, animated: false)
        sendButton.imageView?.backgroundColor = tintColor
        sendButton.setSize(CGSize(width: 48, height: 48), animated: false)
        sendButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        sendButton.image = #imageLiteral(resourceName: "ic_up")
        sendButton.title = nil
        sendButton.imageView?.layer.cornerRadius = 16
        sendButton.backgroundColor = .clear
        middleContentViewPadding = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        separatorLine.isHidden = true
        isTranslucent = true
    }
    
}
