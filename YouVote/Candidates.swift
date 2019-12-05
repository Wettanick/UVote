//  UVote
//
//  Nicholas Wetta
//  Austin Mestayer
//  Brian Gates

import UIKit
import Firebase

//Class that handles displaying the available candidates for a specific district of an election
class Candidates: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var numOfFilters: Int = 0
    var proLife: Bool = false
    var proChoice: Bool = false
    var climateChange: Bool = false
    var proGunControl: Bool = false
    var pro2ndAmendment: Bool = false
    var proTrump: Bool = false
    var proLGBTQRights: Bool = false
    var decriminalizingMarijuana: Bool = false
    var singlePayerHealthcare: Bool = false
    
    @IBOutlet weak var ProLife: UIButton!
    @IBOutlet weak var ProChoice: UIButton!
    @IBOutlet weak var ClimateChange: UIButton!
    @IBOutlet weak var ProGunControl: UIButton!
    @IBOutlet weak var Pro2ndAmendment: UIButton!
    @IBOutlet weak var ProTrump: UIButton!
    @IBOutlet weak var ProLGBTQRights: UIButton!
    @IBOutlet weak var DecriminalizingMarijuana: UIButton!
    @IBOutlet weak var SinglePayerHealthcare: UIButton!
    
    @IBOutlet weak var HeaderText: UITextField!
    
    @IBOutlet weak var CandidatePickerView: UIPickerView!
    var CandidateNames:[String] = []
    
    //To setup pickerview, the number of components must be selected. There is only one option for the User to select.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //To setup pickerview, the number of rows is populated by the array containing the different candidates.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CandidateNames.count
    }
    
    //To setup pickerview, the name of each row is set to the value of the array containing the different candidates.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CandidateNames[row]
    }
    
    //Handles when the User swaps from one item to another in the pickerview
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        GlobalVariables.Variables.CandidateIndex = row
        
    }
    
    //Method to setup view when it is displayed
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Grab Default Value
        GlobalVariables.Variables.CandidateIndex = 0
        
        if (GlobalVariables.Variables.Names.count != 0) {
            for i in 0...GlobalVariables.Variables.Names.count-1 {
                CandidateNames.append(GlobalVariables.Variables.Names[i] + " - " + GlobalVariables.Variables.Party[i])
            }
        }
        else {
            CandidateNames.append("No Candidates Available")
        }
        
        CandidatePickerView.delegate = self
        CandidatePickerView.dataSource = self
        
        HeaderText.text = GlobalVariables.Variables.CurrentDistrict + " " + "Candidates"
        
        //Assert to check if candidates are being displayed.
        assert(CandidateNames != [], "Confirms that candidates are being displayed")
        
        
    }
    
    
    //Method to add or remove Pro Life Filter
    @IBAction func ProLife(_ sender: Any) {
        if (proLife == false) {
            numOfFilters += 1
            proLife = true
            ProLife.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            proLife = false
            ProLife.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Pro Choice Filter
    @IBAction func ProChoice(_ sender: Any) {
        if (proChoice == false) {
            numOfFilters += 1
            proChoice = true
            ProChoice.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            proChoice = false
            ProChoice.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Climate Change Filter
    @IBAction func ClimateChange(_ sender: Any) {
        if (climateChange == false) {
            numOfFilters += 1
            climateChange = true
            ClimateChange.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            climateChange = false
            ClimateChange.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Pro Gun Control Filter
    @IBAction func ProGunControl(_ sender: Any) {
        if (proGunControl == false) {
            numOfFilters += 1
            proGunControl = true
            ProGunControl.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            proGunControl = false
            ProGunControl.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Pro 2nd Amendment Filter
    @IBAction func Pro2ndAmendment(_ sender: Any) {
        if (pro2ndAmendment == false) {
            numOfFilters += 1
            pro2ndAmendment = true
            Pro2ndAmendment.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            pro2ndAmendment = false
            Pro2ndAmendment.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Pro Trump Filter
    @IBAction func ProTrump(_ sender: Any) {
        if (proTrump == false) {
            numOfFilters += 1
            proTrump = true
            ProTrump.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            proTrump = false
            ProTrump.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Pro LGBTQ Rights Filter
    @IBAction func ProLGBTQRights(_ sender: Any) {
        if (proLGBTQRights == false) {
            numOfFilters += 1
            proLGBTQRights = true
            ProLGBTQRights.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            proLGBTQRights = false
            ProLGBTQRights.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Decriminalizing Marijuana Filter
    @IBAction func DecriminalizingMarijuana(_ sender: Any) {
        if (decriminalizingMarijuana == false) {
            numOfFilters += 1
            decriminalizingMarijuana = true
            DecriminalizingMarijuana.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            decriminalizingMarijuana = false
            DecriminalizingMarijuana.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to add or remove Single Payer Healthcare Filter
    @IBAction func SinglePayerHealthcare(_ sender: Any) {
        if (singlePayerHealthcare == false) {
            numOfFilters += 1
            singlePayerHealthcare = true
            SinglePayerHealthcare.backgroundColor = UIColor.green
        }
        else {
            numOfFilters -= 1
            singlePayerHealthcare = false
            SinglePayerHealthcare.backgroundColor = UIColor.lightGray
        }
        CandidatePickerView.reloadComponent(0)
    }
    
    //Method to clear all applied filters
    @IBAction func ClearFilters(_ sender: Any) {
        numOfFilters = 0
        proLife = false
        proChoice = false
        climateChange = false
        proGunControl = false
        pro2ndAmendment = false
        proTrump = false
        proLGBTQRights = false
        decriminalizingMarijuana = false
        singlePayerHealthcare = false
        
        ProLife.backgroundColor = UIColor.lightGray
        ProChoice.backgroundColor = UIColor.lightGray
        ClimateChange.backgroundColor = UIColor.lightGray
        ProGunControl.backgroundColor = UIColor.lightGray
        Pro2ndAmendment.backgroundColor = UIColor.lightGray
        ProTrump.backgroundColor = UIColor.lightGray
        ProLGBTQRights.backgroundColor = UIColor.lightGray
        DecriminalizingMarijuana.backgroundColor = UIColor.lightGray
        SinglePayerHealthcare.backgroundColor = UIColor.lightGray
        
        CandidatePickerView.reloadComponent(0)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if (numOfFilters != 0 && CandidateNames[0] != "No Candidates Available") {
            if ((GlobalVariables.Variables.ClimateChange[row] == false && climateChange) || (GlobalVariables.Variables.ProChoice[row] == false && proChoice) || (GlobalVariables.Variables.ProLife[row] == false && proLife) || (GlobalVariables.Variables.ProGunControl[row] == false && proGunControl) || (GlobalVariables.Variables.Pro2ndAmendment[row] == false && pro2ndAmendment) || (GlobalVariables.Variables.ProTrump[row] == false && proTrump) || (GlobalVariables.Variables.ProLGBTQRights[row] == false && proLGBTQRights) || (GlobalVariables.Variables.DecriminalizingMarijuana[row] == false && decriminalizingMarijuana) || (GlobalVariables.Variables.SinglePayerHealthcare[row] == false && singlePayerHealthcare)) {
                return NSAttributedString(string: CandidateNames[row], attributes: [NSAttributedString.Key.backgroundColor : UIColor.red])
            }
            else {
                return NSAttributedString(string: CandidateNames[row], attributes: [NSAttributedString.Key.backgroundColor : UIColor.green])
            }
        }
        else {
            return NSAttributedString(string: CandidateNames[row], attributes: [NSAttributedString.Key.backgroundColor : UIColor.white])
        }
    }

    
    //Method to return to previous View Controller
    @IBAction func NavigateBackwards(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    //Method to proceed to next View Controller
    @IBAction func NavigateForward(_ sender: Any) {
        
        self.performSegue(withIdentifier: "View Candidate", sender: self)

    }
    

}
