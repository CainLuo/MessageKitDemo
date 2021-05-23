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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        MockSocket.shared.connect(with: [SampleData.shared.nathan, SampleData.shared.wu])
            .onTypingStatus { [weak self] in
                self?.setTypingIndicatorViewHidden(false)
            }.onNewMessage { [weak self] message in
                self?.setTypingIndicatorViewHidden(true, performUpdates: {
                    self?.insertMessage(message)
                })
        }
    }
    
    func setTypingIndicatorViewHidden(_ isHidden: Bool, performUpdates updates: (() -> Void)? = nil) {
        updateTitleView(title: "MessageKit", subtitle: isHidden ? "2 Online" : "Typing...")
        setTypingIndicatorViewHidden(isHidden, animated: true, whilePerforming: updates) { [weak self] success in
            if success, self?.isLastSectionVisible() == true {
                self?.messagesCollectionView.scrollToLastItem(animated: false)
            }
        }
    }
}

// MARK: - Config UIs
extension ChatViewController {
    private func configMessageCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messageCellDelegate = self
        
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        scrollsToLastItemOnKeyboardBeginsEditing = true // default false
        maintainPositionOnKeyboardFrameChanged = true // default false
        
        messagesCollectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(loadMoreMessages), for: .valueChanged)
    }
    
    private func configInputBar() {
        messageInputBar = ChatInputBar()
        messageInputBar.delegate = self
        messageInputBar.inputTextView.tintColor = .red
        messageInputBar.inputTextView.placeholder = "输入内容"
        messageInputBar.sendButton.setTitle("发送", for: .normal)
//        messageInputBar.sendButton.setTitleColor(.red, for: .normal)
//        messageInputBar.sendButton.setTitleColor(UIColor.red.withAlphaComponent(0.3), for: .highlighted)
//        let view = UIView()
//        view.backgroundColor = .red
        
//        messageInputBar.separatorLine.isHidden = true
//        messageInputBar.setRightStackViewWidthConstant(to: 0, animated: false)
//        messageInputBar.setMiddleContentView(view, animated: false)
    }
        
    func loadFirstMessages() {
        DispatchQueue.global(qos: .userInitiated).async {
            let count = 20
            SampleData.shared.getMessages(count: count) { messages in
                DispatchQueue.main.async {
                    self.messageList = messages
                    self.messagesCollectionView.reloadData()
                    self.messagesCollectionView.scrollToLastItem(animated: false)
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
