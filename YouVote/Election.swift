//  UVote
//
//  Nicholas Wetta
//  Austin Meystayer
//  Brian Gates

import UIKit

class Election: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var FavoriteButton: UIButton!
    @IBOutlet weak var ElectionPickerView: UIPickerView!
    var ElectionNames:[String] = ["Louisiana House of Representatives", "Louisiana Senate", "U.S. Congress"]
    
    @IBOutlet weak var FavoriteCandidatePickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == ElectionPickerView) {
            return ElectionNames.count
        }
        else {
            return GlobalVariables.Variables.FavoritesNames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == ElectionPickerView) {
            return ElectionNames[row]
        }
        else {
            return GlobalVariables.Variables.FavoritesNames[row] + " - " + GlobalVariables.Variables.FavoritesParty[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView == ElectionPickerView) {
            GlobalVariables.Variables.CurrentElection = ElectionNames[row]
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Display If No Favorites are Saved
        if (GlobalVariables.Variables.FavoritesNames.isEmpty) {
            FavoriteButton.isHidden = true
        }
        else {
            FavoriteButton.isHidden = false
        }
        FavoriteCandidatePickerView.reloadComponent(0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Grab Default Value
        GlobalVariables.Variables.CurrentElection = ElectionNames[0]
        
        ElectionPickerView.delegate = self
        ElectionPickerView.dataSource = self
        
        FavoriteCandidatePickerView.delegate = self
        FavoriteCandidatePickerView.dataSource = self
      
    }
        
    @IBAction func ViewFavorite(_ sender: Any) {
        
        self.performSegue(withIdentifier: "View Candidate", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "View Candidate") {
            GlobalVariables.Variables.CandidateIndex = FavoriteCandidatePickerView.selectedRow(inComponent: 0)
            let controller = segue.destination as! CandidatePage
            controller.viewingFavorite = true
        }
    }

}
