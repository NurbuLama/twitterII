//
//  tweetCellTableViewCell.swift
//  Twitter
//
//  Created by Nurbu Angdu on 9/27/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class tweetCellTableViewCell: UITableViewCell {
//    @IBOutlet weak var profileImageView: UIImageView!
//    @IBOutlet weak var userNameLabel: UILabel!
//    @IBOutlet weak var tweetContent: UILabel!
    
    var tweetId: Int = -1
    var favorited:Bool = false
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            fav.setImage(UIImage(named: "favor-icon-red"), for:UIControl.State.normal)
        }else{
            fav.setImage(UIImage(named: "favor-icon"), for:UIControl.State.normal)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var reTweet: UIButton!
    
    @IBOutlet weak var fav: UIButton!
    @IBAction func reTweetA(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure:{(error) in print("erroe is retweeting: \(error)")})
        
    }
    func setRetweeted(_ isRetweeted: Bool){
        if(isRetweeted){
            reTweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            reTweet.isEnabled = false
            
        } else{
            reTweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            reTweet.isEnabled = true
            
        }
    }
   
    
    @IBAction func favA(_ sender: Any) {
        let tobeFavorited = !favorited
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite didn't succeed: \(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure:{ (error) in
                print("UnFavorite didn't succeed: \(error)")
            })
        
        
    }
    }

 
        

}
