//
//  ChatViewController+MessageCellDelegate.swift
//  MessageKitDemo
//
//  Created by YYKJ0048 on 2021/2/22.
//

import Foundation
import MessageKit

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
