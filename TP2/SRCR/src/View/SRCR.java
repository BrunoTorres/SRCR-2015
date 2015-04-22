/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class SRCR extends Application {

    public SRCR() {
    }
    
    @Override
    public void start(Stage stage) throws Exception {
       FXMLLoader loader = new FXMLLoader(getClass().getResource("Login.fxml"));
        MainController log_c;
        
        Parent root = loader.load();
        log_c = loader.getController();
        Scene scene = new Scene(root);
        
        stage.setScene(scene);
        stage.show();
        stage.setResizable(false);
        stage.setTitle("Login");
        
        
      
        
     
        
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         launch();
    }
    
}
