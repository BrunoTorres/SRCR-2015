/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;

public class Main_Controller implements Initializable {

    @FXML
    private Button okButto;

   @FXML
    private TextField queryText;

    @FXML
    private ComboBox comboDemo;

    @FXML
    private Button LimparButton;

    @FXML
    private ListView<String> list;

    public Main_Controller() {
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {

        ArrayList<String> estados = new ArrayList<>();
        estados.add("Demo");
        estados.add("Evolução");
        ObservableList<String> options = FXCollections.observableArrayList(estados);
        comboDemo.setItems(options);

       
    }

    @FXML
    void limparButtonAction() {
        this.queryText.setText("");
        this.list.getItems().clear();

    }

    @FXML
    void okButtonAction() {
        int escolhido = comboDemo.getSelectionModel().getSelectedIndex();
        
        
         ObservableList<String> items = FXCollections.observableArrayList(
                "Single", "Double", "Suite", "Family App");
        list.setItems(items);


    }

}
