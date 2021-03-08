/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.main;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.input.MouseEvent;

/**
 * FXML Controller class
 *
 * @author Ing.CORIOLAN
 */
public class LoginController implements Initializable {

    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
    }

  @FXML
    private void close_app(MouseEvent event) {
        System.exit(0);
    }    
    
}
