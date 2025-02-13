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
    private func makeButton(named: String) -> InputBarButtonItem {
        return InputBarButtonItem()
            .configure {
                $0.spacing = .fixed(0)
                $0.image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
                $0.setSize(CGSize(width: 24, height: 24), animated: false)
            }.onSelected {
                $0.tintColor = .systemBlue
            }.onDeselected {
                $0.tintColor = UIColor.lightGray
            }.onTouchUpInside { _ in
                print("Item Tapped")
        }
    }
    
    func configure() {
//        inputTextView.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//        inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
//        self.middleContentViewWrapper.layer.borderWidth = 1.0
//        self.middleContentViewWrapper.layer.cornerRadius = 16.0
//        self.middleContentViewWrapper.layer.masksToBounds = true
//        self.middleContentViewWrapper.layer.borderColor = UIColor.init(hex: "#232329").cgColor
//        padding  = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        middleContentViewPadding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//        leftStackViewWidthConstant = 0
        
        inputTextView.placeholderTextColor = .init(hex: "#81838A")
        
        separatorLine.isHidden = true
        let items = [
            makeButton(named: "ic_camera").onTextViewDidChange { button, textView in
                button.isEnabled = textView.text.isEmpty
                }.onSelected {
                    $0.tintColor = .systemBlue
            },
            makeButton(named: "ic_camera").onTextViewDidChange { button, textView in
                button.isEnabled = textView.text.isEmpty
                }.onSelected {
                    $0.tintColor = .systemBlue
            },
            makeButton(named: "ic_camera").onTextViewDidChange { button, textView in
                button.isEnabled = textView.text.isEmpty
                }.onSelected {
                    $0.tintColor = .systemBlue
                },
            sendButton.onSelected {
                    // We use a transform becuase changing the size would cause the other views to relayout
                    $0.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }.onDeselected {
                    $0.transform = CGAffineTransform.identity
            }
        ]
        setStackViewItems(items, forStack: .right, animated: false)
        rightStackView.backgroundColor = .red
        rightStackView.alignment = .center
    }
    
}
extension iMessageInputBar: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    }
}
