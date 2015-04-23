/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.ResourceBundle;
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

        ArrayList<String> estados = new ArrayList<>();
        estados.add("Demo");
        estados.add("Evolução");
        estados.add("Retract");
        estados.add("Normal");
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

                    esco = "evolucao(";

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
            case 2:
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
            case 3:
                if (this.queryText.getText().equals("")) {
                    a = new Alert(Alert.AlertType.ERROR);
                    a.setTitle("ERRO");
                    a.setHeaderText(null);
                    a.setContentText("Insira a questão ");

                    r = a.showAndWait();
                } else {
                    query = this.queryText.getText().concat(".");

                    resultados = prolog.getStringResults(query);
                    System.out.println("aquiii+++++++++++++++++");
                    for(String s : resultados)
                        System.out.println("s");
                    System.out.println("+++++++++++++++++++");
                    ObservableList<String> myObservableList = FXCollections.observableList(resultados);
                    list.setItems(myObservableList);
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
