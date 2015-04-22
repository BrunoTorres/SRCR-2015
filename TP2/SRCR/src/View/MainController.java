/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import java.awt.Button;
import java.awt.TextField;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javafx.application.Application.launch;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.ListView;
import javafx.stage.Stage;
import se.sics.jasper.SPException;
import srcr.SRCR;

/**
 * FXML Controller class
 *
 *
 */
public class MainController implements Initializable {

    /**
     * Initializes the controller class.
     */
    @FXML
    private javafx.scene.control.TextField querieText;

    @FXML
    private javafx.scene.control.Button okButton;

    @FXML
    private javafx.scene.control.Button sairButton;
    private ListView<String> listView;
    SRCR prolog;

    public MainController() {
    }
    

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            prolog = new SRCR();
        } catch (SPException ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @FXML
    void okButtonAction() {
        String query = this.querieText.getText();
        /*try {
            ArrayList<String> respostas = (ArrayList) prolog.getStringResults(query);
        } catch (Exception ex) {
            Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
        }*/

        ObservableList<String> items = FXCollections.observableArrayList(
                "Single", "Double", "Suite", "Family App");
        listView.setItems(items);

    }

    @FXML
    void sairButtonAction() {

    }

}
