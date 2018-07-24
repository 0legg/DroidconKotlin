//
//  EventTableViewCell.swift
//  ios
//
//  Created by Sahil Ishar on 3/15/16.
//  Copyright © 2016 Kevin Galligan. All rights reserved.
//

import UIKit
import NotepadArchitecture

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var timeInfoLabel : UILabel!
    @IBOutlet weak var timeConflictLabel: UILabel!

    var viewModel:NotepadArchitectureEventViewModel!
    var sessionInfo: NotepadArchitectureSessionInfo!
    
    func loadInfo(_ sessionInfo: NotepadArchitectureSessionInfo,
                  viewModel:NotepadArchitectureEventViewModel) {
        
        self.viewModel = viewModel
        self.sessionInfo = sessionInfo
        
        titleLabel.text = sessionInfo.session.title/*.replacingOccurrences(of: "Android", with: "Lulu")*/
//        let time = TimeUtils.getEventTime(startTime: networkEvent.getStartFormatted()! as NSString, andEnd: networkEvent.getEndFormatted()! as NSString)
        timeInfoLabel.text = "Track " + sessionInfo.session.roomName + ", "// + time
        descriptionLabel.text = sessionInfo.session.description.replacingOccurrences(of: "/n/n", with: "/n")

        if sessionInfo.isNow() {
            timeConflictLabel.isHidden = false
            timeConflictLabel.text = "This session is happening now"
        } else if sessionInfo.isPast() {
            timeConflictLabel.isHidden = false
            timeConflictLabel.text = "This session has already ended"
        } else if (sessionInfo.conflict) {
            timeConflictLabel.isHidden = false
            timeConflictLabel.text = "This session conflicts with another session in your schedule"
        } else {
            timeConflictLabel.isHidden = true
        }
        
        titleLabel.sizeToFit()
        timeInfoLabel.sizeToFit()
        descriptionLabel.sizeToFit()
        timeConflictLabel.sizeToFit()
    }

    func formatHTMLString(_ htmlString: String) -> NSAttributedString {
        let modifiedFont = NSString(format:"<span style=\"font: -apple-system-body; font-size: 12px\">%@</span>", htmlString) as String

        let attrStr = NSAttributedString(
            string: modifiedFont
//            ,
//            attributes: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8]
//            attributes: [NSDocumentTypeDocumentOption: NSHTMLTextDocumentType, NSCharacterEncodingDocumentOption: String.Encoding.utf8]
        )
        
        return attrStr
    }
}
