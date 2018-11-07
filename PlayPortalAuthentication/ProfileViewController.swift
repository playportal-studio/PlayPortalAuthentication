//
//  ProfileViewController.swift
//  PlayPortalAuthentication
//
//  Created by Lincoln Fraley on 11/7/18.
//  Copyright © 2018 Lincoln Fraley. All rights reserved.
//

import Foundation
import UIKit
import PPSDK_Swift

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var handleLabel: UILabel!
    
    var userProfile: PlayPortalProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleLabel.text = userProfile.handle
        coverPhotoImageView.playPortalCoverPhoto(forImageId: userProfile.coverPhoto, nil)
        profilePicImageView.playPortalProfilePic(forImageId: userProfile.profilePic, nil)
    }
}
