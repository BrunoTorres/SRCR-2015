/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package View;

import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
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
         PrintStream print = null;
        try {
            print = new PrintStream("ficheiro.txt");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Main_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
                    System.setOut(print);

        ArrayList<String> estados = new ArrayList<>();
    
        estados.add("Demo   ");                     // 0 Normal
        estados.add("Evolução do Demo - 'e'");         // 1 &&
        estados.add("Evolução do Demo -'ou'");        // 2 || 
        estados.add("Evolução");
        estados.add("Remover");
        ObservableList<String> options = FXCollections.observableArrayList(estados);
        comboDemo.setItems(options);
        this.prolog = new SRCR("/Users/brunopereira/Documents/SourceTree/SRCR/Tp2/TP2.pl");

    }

    @FXML
    void limparButtonAction() {
        this.queryText.setText("");
        this.list.getItems().clear();

    }

    @FXML
    void okButtonAction() throws Exception {

        int escolhido = comboDemo.getSelectionModel().getSelectedIndex();
        String esco;
        String query;
        List<String> resultados;
        boolean chek;
        Optional<ButtonType> r;
        Alert a;
        switch (escolhido) {
            case 0:
                if (this.queryText.getText().equals("")) {
                    a = new Alert(Alert.AlertType.ERROR);
                    a.setTitle("ERRO");
                    a.setHeaderText(null);
                    a.setContentText("Insira a questão ");

                    r = a.showAndWait();
                } else {
                    esco = "demo(";
                    
                    query = esco.concat(this.queryText.getText()).concat(",R).");
              
                   
                   
                    resultados = prolog.getStringResults(query);
                    //System.setOut(System.out);
                    ObservableList<String> myObservableList = FXCollections.observableList(resultados);
                    list.setItems(myObservableList);
                }
                break;
                case 1:
                if (this.queryText.getText().equals("")) {
                    a = new Alert(Alert.AlertType.ERROR);
                    a.setTitle("ERRO");
                    a.setHeaderText(null);
                    a.setContentText("Insira a questão ");

                    r = a.showAndWait();
                } else {
                    esco = "demoE([";
                    
                    query = esco.concat(this.queryText.getText()).concat("],R).");
              
                   
                   
                    resultados = prolog.getStringResults(query);
                    //System.setOut(System.out);
                    ObservableList<String> myObservableList = FXCollections.observableList(resultados);
                    list.setItems(myObservableList);
                }
                break;
                case 2:
                if (this.queryText.getText().equals("")) {
                    a = new Alert(Alert.AlertType.ERROR);
                    a.setTitle("ERRO");
                    a.setHeaderText(null);
                    a.setContentText("Insira a questão ");

                    r = a.showAndWait();
                } else {
                    esco = "demoOu([";
                    
                    query = esco.concat(this.queryText.getText()).concat("],R).");
              
                   
                   
                    resultados = prolog.getStringResults(query);
                    //System.setOut(System.out);
                    ObservableList<String> myObservableList = FXCollections.observableList(resultados);
                    list.setItems(myObservableList);
                }
                break;
            case 3:
                if (this.queryText.getText().equals("")) {
                    a = new Alert(Alert.AlertType.ERROR);
                    a.setTitle("ERRO");
                    a.setHeaderText(null);
                    a.setContentText("Insira a questão ");

                    r = a.showAndWait();
                } else {

                    esco = "evolEvol(";

                    query = esco.concat(this.queryText.getText()).concat(").");

                    chek = prolog.check(query);
                    if (chek) {
                        ObservableList<String> items = FXCollections.observableArrayList(
                                "Inserido");
                        list.setItems(items);
                    } else {
                        ObservableList<String> items = FXCollections.observableArrayList(
                                "Não Inserido");
                        list.setItems(items);
                    }
                }

                break;
            case 4:
                if (this.queryText.getText().equals("")) {
                    a = new Alert(Alert.AlertType.ERROR);
                    a.setTitle("ERRO");
                    a.setHeaderText(null);
                    a.setContentText("Insira a questão ");

                    r = a.showAndWait();
                } else {

                    esco = "retract(";
                    query = esco.concat(this.queryText.getText()).concat(").");

                    chek = prolog.check(query);
                    if (chek) {
                        ObservableList<String> items = FXCollections.observableArrayList(
                                "Removido");
                        list.setItems(items);
                    } else {
                        ObservableList<String> items = FXCollections.observableArrayList(
                                "Não Removido");
                        list.setItems(items);
                    }
                }

                break;
           

            default:

                a = new Alert(Alert.AlertType.ERROR);
                a.setTitle("ERRO");
                a.setHeaderText(null);
                a.setContentText("Escolha a opção ");

                r = a.showAndWait();
                break;

        }

    }

}
