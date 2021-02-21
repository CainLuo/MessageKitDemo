//
//  ChatViewController.swift
//  Message
//
//  Created by CainLuo on 2020/10/8.
//

import UIKit
import MessageKit
import InputBarAccessoryView

class ChatViewController: MessagesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configMessageCollectionView()
        configInputBar()
    }
}

//extension ChatViewController: MessagesDataSource {
//    func currentSender() -> SenderType {
//        <#code#>
//    }
//
//    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
//        <#code#>
//    }
//
//    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
//        <#code#>
//    }
//}

extension ChatViewController: MessageCellDelegate {
    func didTapAvatar(in cell: MessageCollectionViewCell) {
        print("点击了头像")
    }
    
    func didTapMessage(in cell: MessageCollectionViewCell) {
        print("点击了消息")
    }
    
    func didTapImage(in cell: MessageCollectionViewCell) {
        print("点击了图片")
    }
    
    func didTapCellTopLabel(in cell: MessageCollectionViewCell) {
        print("点击了文本")
    }
    
    func didTapCellBottomLabel(in cell: MessageCollectionViewCell) {
        print("点击了Cell底部的文字")
    }
    
    func didTapMessageTopLabel(in cell: MessageCollectionViewCell) {
        print("点击了顶部消息的文字")
    }
    
    func didTapMessageBottomLabel(in cell: MessageCollectionViewCell) {
        print("点击了底部消息的文字")
    }

    func didTapPlayButton(in cell: AudioMessageCell) {
        print("点击了播放按钮")
    }
    
    func didStartAudio(in cell: AudioMessageCell) {
        print("点击了开始播放按钮")
    }

    func didPauseAudio(in cell: AudioMessageCell) {
        print("点击了暂停按钮")
    }

    func didStopAudio(in cell: AudioMessageCell) {
        print("点击了停止播放按钮")
    }

    func didTapAccessoryView(in cell: MessageCollectionViewCell) {
        print("点击了附件")
    }
}

extension ChatViewController: InputBarAccessoryViewDelegate {
    
}

extension ChatViewController {
    func configMessageCollectionView() {
        messagesCollectionView.delegate = self
        
        scrollsToBottomOnKeyboardBeginsEditing = true
        maintainPositionOnKeyboardFrameChanged = true
        
        showMessageTimestampOnSwipeLeft = true
    }
    
    func configInputBar() {
        messageInputBar.delegate = self
        messageInputBar.inputTextView.tintColor = .red
        messageInputBar.inputTextView.placeholder = "输入内容"
        messageInputBar.sendButton.setTitle("发送", for: .normal)
        messageInputBar.sendButton.setTitleColor(.red, for: .normal)
        messageInputBar.sendButton.setTitleColor(UIColor.red.withAlphaComponent(0.3), for: .highlighted)
    }
}
