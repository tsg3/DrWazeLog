package com.tec.WazeLog.GUI;

import com.tec.WazeLog.grafos.*;
import com.tec.WazeLog.conexion.PLConexion;


import javafx.application.Platform;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.scene.control.Button;
import javafx.scene.shape.*;

import javax.swing.*;
import java.io.IOException;


public class Main extends Application implements EventHandler<ActionEvent> {

    java.lang.Boolean find = false;

    Stage primary;

    WLWindow window = new WLWindow(1250, 900, "WazeLog");

    PLConexion conexion = new PLConexion();

    public static void main(String[] args) {
        launch(args);
    }


    @Override
    public void start(Stage stage) {


        for (java.lang.Integer i = 0; i < conexion.getLength("consult('DrWazeLog.pl')", "ruta(X, Y, Peso)");
             i++) {
            window.addRoute(conexion.getRuta("consult('DrWazeLog.pl')", "ruta(X, Y, Peso)", "X", i),
                    conexion.getRuta("consult('DrWazeLog.pl')", "ruta(X, Y, Peso)", "Y", i),
                    java.lang.Integer.valueOf(conexion.getRuta("consult('DrWazeLog.pl')", "ruta(X, Y, Peso)", "Peso", i)));
        }


        stage = window.getStage().getStage();

        window.createbuttons();
        window.createLines();
        window.createPesos();

        for (WLComponent l : window.getLines()) {

            l.draw(window.layout.getLayout());
        }
        for (WLComponent b : window.getButtons()) {

            b.draw(window.layout.getLayout());
            b.getWlButton().setOnAction(this);


        }

        for (WLComponent n : window.getPesos()) {

            n.draw(window.layout.getLayout());
        }


        window.getRestartButton().getWlButton().setOnAction(event -> {
            if (window.getdInicio().getText().getText().isEmpty() ||
                    window.getdFinal().getText().getText().isEmpty() ||
                    window.getNewPeso().getText().getText().isEmpty()) {
                JOptionPane.showMessageDialog(new JFrame("Aviso"), "Por favor agregue el nombre de la direccion que desea" +
                        "añadir y el peso");
            } else {


                java.lang.Integer peso = java.lang.Integer.valueOf(window.getNewPeso().getText().getText());
                try {
                    conexion.addRuta("DrWazeLog.pl", window.getdInicio().getText().getText(),
                            window.getdFinal().getText().getText(), peso);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                window.getStage().getStage().close();
                Platform.runLater(() -> new Main().start(new Stage()));
            }
        });

        stage.setScene(window.getScene().getScene());
        stage.show();


    }

    @Override
    public void handle(ActionEvent actionEvent) {


        for (WLComponent b : window.getButtons()) {
            if (actionEvent.getSource() == b.getWlButton()) {

                if (find == false) {

                    b.setPrimero(true);
                    find = true;

                } else {

                    for (WLComponent b2 : window.getButtons()) {

                        if (b2.getPrimero() == true) {
                            JOptionPane.showMessageDialog(new JFrame("Aviso"),
                                    conexion.getRuta("consult('DrWazeLog.pl')", b2.getLugar(), b.getLugar()));
                            b2.setPrimero(false);
                            find = false;


                        }

                    }
                }
            }

        }

    }
}

