//
//  ChatViewController+MessagesDataSource.swift
//  MessageKitDemo
//
//  Created by YYKJ0048 on 2021/2/22.
//

import Foundation
import MessageKit

extension ChatViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return SampleData.shared.currentSender
    }
    
    // 返回消息的数量
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }
    
    // 返回消息类型
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageList[indexPath.section]
    }
    
    // 返回分割的日期
    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        if indexPath.section % 3 == 0 {
            return NSAttributedString(string: MessageKitDateFormatter.shared.string(from: message.sentDate),
                                      attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10),
                                                   NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        }
        return nil
    }
    
    // 返回是否已读
    func cellBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        
//        return NSAttributedString(string: "Read", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        nil
    }
    
    // 返回姓名
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    }
    
    // 返回日期
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        
        let dateString = formatter.string(from: message.sentDate)
        return NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption2)])
//        nil
    }
}
