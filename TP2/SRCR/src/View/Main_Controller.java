/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import srcr.SRCR;

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
    SRCR prolog;

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
    void okButtonAction() throws Exception {
        this.prolog = new SRCR("/Users/brunopereira/Documents/SourceTree/SRCR/Tp2/TP2.pl");

        int escolhido = comboDemo.getSelectionModel().getSelectedIndex();
        String esco;

        switch (escolhido) {
            case 0:
                esco = "demo(";
                break;
            default:
                esco = "evolucao(";
                break;
        }
        System.out.println(queryText.getText());
        String query = esco.concat(this.queryText.getText()).concat(",R).");
        System.out.println(query);
        List<String> resultados = prolog.getStringResults(query);
        System.out.println("cenas");
        System.out.println(resultados.get(0));
        
       
        System.out.println(resultados.get(0));
        ObservableList<String> names = FXCollections.observableArrayList(resultados);
         list = new ListView<>(names);
                

        
    }

}
