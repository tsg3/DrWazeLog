package com.tec.WazeLog.GUI;

import com.tec.WazeLog.grafos.*;

import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.stage.Stage;
import javafx.scene.control.Button;

import javax.swing.*;

public class WLLine implements  WLComponent{

    private java.lang.Integer peso;
    private java.lang.Integer posX;
    private java.lang.Integer posY;
    private java.lang.Integer posX2;
    private java.lang.Integer posY2;
    public Line line;

    public WLLine(java.lang.Integer peso, java.lang.Integer posX1, java.lang.Integer posY1,
                  java.lang.Integer posX2, java.lang.Integer posY2) {

        if (peso > 0) {
            this.peso = peso;

            //No se si dejarlo
            this.posX = posX1 + 50;
            this.posY = posY1 + 50;
            this.posX2 = posX2 + 50;
            this.posY2 = posY2 + 50;
            //No se si dejarlo

            this.line = new Line(posX1 + 50, posY1 + 50, posX2 + 50, posY2 + 50);
            this.line.setStrokeWidth(5);

            if (peso <= 5) {
                this.line.setStroke(Color.GREEN);
            } else if (peso >= 25){
                this.line.setStroke(Color.RED);
            }else {
                this.line.setStroke(Color.YELLOW);
            }



        }else{
            JOptionPane.showMessageDialog(new JFrame("Aviso"),"No se le puede asignar un valor menor o " +
                    "igual a 0 al peso" );
        }
    }

    @Override
    public java.lang.Integer getPeso() {
        return peso;
    }

    @Override
    public String getLugar() {
        return null;
    }

    @Override
    public Boolean getPrimero() {
        return null;
    }

    @Override
    public Button getWlButton() {
        return null;
    }

    public java.lang.Integer getPosX() {
        return posX;
    }

    public java.lang.Integer getPosY() {
        return posY;
    }

    public java.lang.Integer getPosX2() {
        return posX2;
    }

    public java.lang.Integer getPosY2() {
        return posY2;
    }

    public Line getLine() {
        return line;
    }

    @Override
    public void draw(Pane layout) {

        layout.getChildren().add(this.line);
    }

    @Override
    public void setPrimero(Boolean primero) {

    }
}
