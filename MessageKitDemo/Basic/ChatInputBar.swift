//
//  ChatInputBar.swift
//  MessageKitDemo
//
//  Created by CainLuo on 2021/5/22.
//

import UIKit
import InputBarAccessoryView

class ChatInputBar: InputBarAccessoryView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCamera()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var attachmentManager: AttachmentManager = { [unowned self] in
         let manager = AttachmentManager()
         manager.delegate = self
         return manager
     }()

    private func configureCamera() {
        var items: [InputBarButtonItem] = []
        
        for _ in 0...5 {
            let camera = makeButton(named: "ic_camera")
            camera.tintColor = .darkGray
            camera.onTouchUpInside { (item) in
                print("点击了相机")
            }
            items.append(camera)
        }
        
        bottomStackView.distribution = .fillEqually
        setLeftStackViewWidthConstant(to: 0, animated: false)
        setStackViewItems(items, forStack: .bottom, animated: false)
        inputPlugins = [attachmentManager]
    }
    
    private func makeButton(named: String) -> InputBarButtonItem {
        return InputBarButtonItem()
            .configure {
                $0.image = UIImage(named: named)?.withRenderingMode(.alwaysTemplate)
                $0.setSize(CGSize(width: 30, height: 30), animated: false)
            }.onSelected {
                $0.tintColor = .systemBlue
            }.onDeselected {
                $0.tintColor = UIColor.lightGray
            }.onTouchUpInside { _ in
                print("Item Tapped")
        }
    }
}

// MARK: - AttachmentManagerDelegate
extension ChatInputBar: AttachmentManagerDelegate {
    func attachmentManager(_ manager: AttachmentManager, shouldBecomeVisible: Bool) {
    }
}
