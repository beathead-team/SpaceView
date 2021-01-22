//
//  SpaceWindow.swift
//  SpaceView
//
//  Created by user on 25.12.16.
//  Copyright © 2016 horoko. All rights reserved.
//

import UIKit

open class SpaceWindow: UIWindow {
    public func showSpaceView(with spaceOptions: [SpaceOptions]) {
        spaceOptionsQueue.append(spaceOptions)
        processQueue()
    }

    private var activeSpaceView: SpaceView?
    private var spaceOptionsQueue = [[SpaceOptions]]()
}

extension SpaceWindow {
    public override func exchangeSubview(at index1: Int, withSubviewAt index2: Int) {
        super.exchangeSubview(at: index1, withSubviewAt: index2)
        bringSpaceViewToFront()
    }

    public override func addSubview(_ view: UIView) {
        super.addSubview(view)
        bringSpaceViewToFront()
    }

    public override func insertSubview(_ view: UIView, at index: Int) {
        super.insertSubview(view, at: index)
        bringSpaceViewToFront()
    }

    public override func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) {
        super.insertSubview(view, aboveSubview: siblingSubview)
        bringSpaceViewToFront()
    }

    public override func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView) {
        super.insertSubview(view, belowSubview: siblingSubview)
        bringSpaceViewToFront()
    }

    public override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)

        if subview == activeSpaceView?.spaceView {
            activeSpaceView = nil
            processQueue()
        }
    }

    public override func bringSubviewToFront(_ view: UIView) {
        super.bringSubviewToFront(view)
        bringSpaceViewToFront()
    }

    public override func sendSubviewToBack(_ view: UIView) {
        super.sendSubviewToBack(view)
        bringSpaceViewToFront()
    }
}

extension SpaceWindow {
    private func bringSpaceViewToFront() {
        if let spaceView = activeSpaceView?.spaceView,
            spaceView.superview == self {
            super.bringSubviewToFront(spaceView)
        }
    }

    private func processQueue() {
        guard activeSpaceView == nil,
            let spaceOptions = spaceOptionsQueue.first else { return }

        spaceOptionsQueue.removeFirst()
        let spaceView = SpaceView(spaceOptions: spaceOptions)
        spaceView.show(in: self)
        self.activeSpaceView = spaceView
    }
}
