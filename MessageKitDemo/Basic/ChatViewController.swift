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
    
    var messageList = [MockMessage]()
    
    let refreshControl = UIRefreshControl()

    open lazy var audioController = BasicAudioController(messageCollectionView: messagesCollectionView)

    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "客服中心"
        configMessageCollectionView()
        configInputBar()
        loadFirstMessages()
    }
}


// MARK: - Config UIs
extension ChatViewController {
    private func configMessageCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messageCellDelegate = self
        
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        scrollsToBottomOnKeyboardBeginsEditing = true // default false
        maintainPositionOnKeyboardFrameChanged = true // default false
        
        messagesCollectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(loadMoreMessages), for: .valueChanged)
    }
    
    private func configInputBar() {
        messageInputBar.delegate = self
        messageInputBar.inputTextView.tintColor = .red
        messageInputBar.inputTextView.placeholder = "输入内容"
        messageInputBar.sendButton.setTitle("发送", for: .normal)
        messageInputBar.sendButton.setTitleColor(.red, for: .normal)
        messageInputBar.sendButton.setTitleColor(UIColor.red.withAlphaComponent(0.3), for: .highlighted)
        let view = UIView()
        view.backgroundColor = .red
        
        messageInputBar.separatorLine.isHidden = true
        messageInputBar.setRightStackViewWidthConstant(to: 0, animated: false)
        messageInputBar.setMiddleContentView(view, animated: false)
    }
    
    func loadFirstMessages() {
        DispatchQueue.global(qos: .userInitiated).async {
            let count = 20
            SampleData.shared.getMessages(count: count) { messages in
                DispatchQueue.main.async {
                    self.messageList = messages
                    self.messagesCollectionView.reloadData()
                    self.messagesCollectionView.scrollToBottom()
                }
            }
        }
    }
    
    @objc
    func loadMoreMessages() {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1) {
            SampleData.shared.getMessages(count: 20) { messages in
                DispatchQueue.main.async {
                    self.messageList.insert(contentsOf: messages, at: 0)
                    self.messagesCollectionView.reloadDataAndKeepOffset()
                    self.refreshControl.endRefreshing()
                }
            }
        }
    }
}
