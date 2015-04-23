/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import java.util.Properties;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;




public class SrcrMain extends Application {
    
    //private ObservableList<Voluntario> vols = FXCollections.observableArrayList();
    //private HabitatDAO HabitatDAO;
    
    public SrcrMain()  {
        /*Properties props = new Properties();
        props.setProperty("user", "habitat");
        props.setProperty("password", "password");
        props.setProperty("host", "servidor.freeum.info");
        props.setProperty("port", "5223");
        props.setProperty("db_type", "mysql");
        HabitatDAO.setProperties(props);*/
    }
    
    @Override
    public void start(Stage stage) throws Exception {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("Main.fxml"));
        Main_Controller log_c;
        
        Parent root = loader.load();
        log_c = loader.getController();
        Scene scene = new Scene(root);
        
        stage.setScene(scene);
        stage.show();
        stage.setResizable(false);
        stage.setTitle("AutoUsados");
        
        
        
        
        
    }

    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        launch(args);
    }
    
}
