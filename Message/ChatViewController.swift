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
    
    var messageList: [Any] = []
    
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

// MARK: - MessagesLayoutDelegate
extension ChatViewController: MessagesLayoutDelegate {
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 18
    }
    
    func cellBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 17
    }
    
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 20
    }
    
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 16
    }
}

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

// MARK: - MessageLabelDelegate

extension ChatViewController: MessageLabelDelegate {
    
    func didSelectAddress(_ addressComponents: [String: String]) {
        print("Address Selected: \(addressComponents)")
    }
    
    func didSelectDate(_ date: Date) {
        print("Date Selected: \(date)")
    }
    
    func didSelectPhoneNumber(_ phoneNumber: String) {
        print("Phone Number Selected: \(phoneNumber)")
    }
    
    func didSelectURL(_ url: URL) {
        print("URL Selected: \(url)")
    }
    
    func didSelectTransitInformation(_ transitInformation: [String: String]) {
        print("TransitInformation Selected: \(transitInformation)")
    }

    func didSelectHashtag(_ hashtag: String) {
        print("Hashtag selected: \(hashtag)")
    }

    func didSelectMention(_ mention: String) {
        print("Mention selected: \(mention)")
    }

    func didSelectCustom(_ pattern: String, match: String?) {
        print("Custom data detector patter selected: \(pattern)")
    }
}

// MARK: - Config UIs
extension ChatViewController {
    private func configMessageCollectionView() {
        messagesCollectionView.delegate = self
        
        scrollsToLastItemOnKeyboardBeginsEditing = true
        maintainPositionOnKeyboardFrameChanged = true
        
//        showMessageTimestampOnSwipeLeft = true
    }
    
    private func configInputBar() {
        messageInputBar.delegate = self
        messageInputBar.inputTextView.tintColor = .red
        messageInputBar.inputTextView.placeholder = "输入内容"
        messageInputBar.sendButton.setTitle("发送", for: .normal)
        messageInputBar.sendButton.setTitleColor(.red, for: .normal)
        messageInputBar.sendButton.setTitleColor(UIColor.red.withAlphaComponent(0.3), for: .highlighted)
    }
}

extension ChatViewController {
    
}
