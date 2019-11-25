//  UVote
//
//  Nicholas Wetta
//  Austin Meystayer
//  Brian Gates

import UIKit

class CandidatePage: UIViewController {
    
    var viewingFavorite: Bool = false
    var name: String = ""
    var party: String = ""
    var summary: String = ""
    var link: String = ""
    @IBOutlet weak var FavoriteButton: UIButton!
    @IBOutlet weak var HeaderText: UITextField!
    @IBOutlet weak var PartyText: UITextField!
    @IBOutlet weak var InformationText: UITextView!
    @IBOutlet weak var CandidateImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if (!viewingFavorite) {
            name = GlobalVariables.Variables.Names[GlobalVariables.Variables.CandidateIndex]
            party = GlobalVariables.Variables.Party[GlobalVariables.Variables.CandidateIndex]
            summary = GlobalVariables.Variables.Summary[GlobalVariables.Variables.CandidateIndex]
            link = GlobalVariables.Variables.ImageLink[GlobalVariables.Variables.CandidateIndex]
            
            HeaderText.text = GlobalVariables.Variables.Names[GlobalVariables.Variables.CandidateIndex]
            PartyText.text = GlobalVariables.Variables.Party[GlobalVariables.Variables.CandidateIndex]
            InformationText.text = GlobalVariables.Variables.Summary[GlobalVariables.Variables.CandidateIndex]
            let url = URL(string: GlobalVariables.Variables.ImageLink[GlobalVariables.Variables.CandidateIndex])
            if (url != nil) {
                guard let data = try? Data(contentsOf: url!) else {
                    return
                }
                CandidateImage.image = UIImage(data : data)
            }
        }
        else {
            FavoriteButton.setTitle("Unfavorite", for: UIControl.State.normal)
            
            name = GlobalVariables.Variables.FavoritesNames[GlobalVariables.Variables.CandidateIndex]
            party = GlobalVariables.Variables.FavoritesParty[GlobalVariables.Variables.CandidateIndex]
            summary = GlobalVariables.Variables.FavoritesSummary[GlobalVariables.Variables.CandidateIndex]
            link = GlobalVariables.Variables.FavoritesImageLink[GlobalVariables.Variables.CandidateIndex]
            
            HeaderText.text = GlobalVariables.Variables.FavoritesNames[GlobalVariables.Variables.CandidateIndex]
            PartyText.text = GlobalVariables.Variables.FavoritesParty[GlobalVariables.Variables.CandidateIndex]
            InformationText.text = GlobalVariables.Variables.FavoritesSummary[GlobalVariables.Variables.CandidateIndex]
            let url = URL(string: GlobalVariables.Variables.FavoritesImageLink[GlobalVariables.Variables.CandidateIndex])
            if (url != nil) {
                guard let data = try? Data(contentsOf: url!) else {
                    return
                }
                CandidateImage.image = UIImage(data : data)
            }
        }
        
    }
    
    @IBAction func FavoriteButton(_ sender: Any) {
        
        if !(GlobalVariables.Variables.FavoritesNames.contains(name)) {
            
            GlobalVariables.Variables.FavoritesNames.append(name)
            GlobalVariables.Variables.FavoritesParty.append(party)
            GlobalVariables.Variables.FavoritesSummary.append(summary)
            GlobalVariables.Variables.FavoritesImageLink.append(link)
            
            //print("Favorite Added")
            
            FavoriteButton.setTitle("Unfavorite", for: UIControl.State.normal)
            
            let defaults = UserDefaults.standard
            defaults.set(GlobalVariables.Variables.FavoritesNames, forKey: "FavoriteNames")
            defaults.set(GlobalVariables.Variables.FavoritesParty, forKey: "FavoriteParty")
            defaults.set(GlobalVariables.Variables.FavoritesSummary, forKey: "FavoriteSummary")
            defaults.set(GlobalVariables.Variables.FavoritesImageLink, forKey: "FavoriteImageLink")
        }
            
        else {
            
            let index = GlobalVariables.Variables.FavoritesNames.firstIndex(of: name)
            GlobalVariables.Variables.FavoritesNames.remove(at: index!)
            GlobalVariables.Variables.FavoritesParty.remove(at: index!)
            GlobalVariables.Variables.FavoritesSummary.remove(at: index!)
            GlobalVariables.Variables.FavoritesImageLink.remove(at: index!)
            
            //print("Favorite Removed")
            
            FavoriteButton.setTitle("Favorite", for: UIControl.State.normal)
            
            let defaults = UserDefaults.standard
            defaults.set(GlobalVariables.Variables.FavoritesNames, forKey: "FavoriteNames")
            defaults.set(GlobalVariables.Variables.FavoritesParty, forKey: "FavoriteParty")
            defaults.set(GlobalVariables.Variables.FavoritesSummary, forKey: "FavoriteSummary")
            defaults.set(GlobalVariables.Variables.FavoritesImageLink, forKey: "FavoriteImageLink")
        }

        
    }
    
    
    @IBAction func ViewFavorite(_ sender: Any) {

            self.dismiss(animated: true)
        
    }
    
    
}


