//  UVote
//
//  Nicholas Wetta
//  Austin Mestayer
//  Brian Gates

import UIKit

//Class that handles displaying the available elections for a User to select from, as well as giving the option to view favorite candidates that have been saved
class Election: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var FavoriteButton: UIButton!
    @IBOutlet weak var ElectionPickerView: UIPickerView!
    var ElectionNames:[String] = ["Louisiana House of Representatives", "Louisiana Senate", "U.S. Congress"]
    
    @IBOutlet weak var FavoriteCandidatePickerView: UIPickerView!
    
    //To setup pickerview, the number of components must be selected. There is only one option for the User to select.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //To setup Election pickerview, the number of rows is populated by the array containing the different elections.
    //To setup Favorites pickerview, the number of rows is populated by the array containing the different favorite candidates.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == ElectionPickerView) {
            return ElectionNames.count
        }
        else {
            return GlobalVariables.Variables.FavoritesNames.count
        }
    }
    
    //To setup Election pickerview, the name of each row is set to the value of the array containing the different elections.
    //To setup Favorites pickerview, the name of each row is set to the value of the array containing the different candidates.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == ElectionPickerView) {
            return ElectionNames[row]
        }
        else {
            return GlobalVariables.Variables.FavoritesNames[row] + " - " + GlobalVariables.Variables.FavoritesParty[row]
        }
    }
    
    //Handles when the User swaps from one item to another in the pickerview
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView == ElectionPickerView) {
            GlobalVariables.Variables.CurrentElection = ElectionNames[row]
        }
        
    }
    
    //Method to hide or display Favorites depending on if the array is empty or not
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
    
    //Method to setup view when it is displayed
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
    
    //Method to proceed to next View Controller
    @IBAction func ViewFavorite(_ sender: Any) {
        
        self.performSegue(withIdentifier: "View Candidate", sender: self)
        
    }
    
    //Method to pass values to next View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "View Candidate") {
            GlobalVariables.Variables.CandidateIndex = FavoriteCandidatePickerView.selectedRow(inComponent: 0)
            let controller = segue.destination as! CandidatePage
            controller.viewingFavorite = true
        }
    }

}
