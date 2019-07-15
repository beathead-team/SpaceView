//
//  SpaceOptions.swift
//  SpaceView
//
//  Created by user on 25.12.16.
//  Copyright © 2016 horoko. All rights reserved.
//

import UIKit

public enum HideDirection {
    case right
    case left
    case top
    case bot
}

public enum SpacePosition {
    case top
    case bot
}

public enum SpaceStyles {
    case success
    case error
    case warning
}

public enum SpaceOptions {
    case spaceColor(color: UIColor)
    case spaceDescription(text: String)
    case spaceTitle(text: String)
    case spaceHeight(height: CGFloat)
    case spaceHideTimer(timer: Double)
    case customView(view: UIView)
    case tapAction(() -> ())
    case spaceShowDuration(duration: Double)
    case spaceHideDuration(duration: Double)
    case spaceReturnDuration(duration: Double)
    case spaceHideDelay(delay: Double)
    case spaceShowDelay(delay: Double)
    case spaceReturnDelay(delay: Double)
    case possibleDirectionToHide([HideDirection])
    case image(img: UIImage?)
    case titleView(view: UILabel)
    case descriptionView(view: UILabel)
    case titleColor(color: UIColor)
    case descriptionColor(color: UIColor)
    case titleFont(font: UIFont)
    case descriptionFont(font: UIFont)
    case shouldAutoHide(should: Bool)
    case spaceStyle(style: SpaceStyles?)
    case spacePosition(position: SpacePosition)
    case swipeAction(() -> ())
    case buttonAction(() -> ())
}
