package com.tec.WazeLog.GUI;

import com.tec.WazeLog.grafos.*;

import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.scene.control.Button;

public class WLButton implements  WLComponent{

    private java.lang.String lugar;
    private java.lang.Integer posX;
    private java.lang.Integer posY;
    private java.lang.Integer radio;
    public Button wlButton;
    public java.lang.Boolean primero;




    public WLButton(java.lang.String lugar, java.lang.Integer posX, java.lang.Integer posY,
                    java.lang.Integer radio){

        this.lugar = lugar;
        this.posX = posX;
        this.posY = posY;
        this.radio = radio;

        this.primero = false;
        this.wlButton = new Button();

        wlButton.setText(lugar);
        wlButton.setLayoutX(posX);
        wlButton.setLayoutY(posY);
        wlButton.setStyle(
                "-fx-background-radius: " + this.radio + "; " +
                        "-fx-min-width: "+ this.radio + "; " +
                        "-fx-min-height: " + this.radio + "; " +
                        "-fx-max-width: " + this.radio + "; " +
                        "-fx-max-height: " + this. radio + ";"

        );
    }
    public WLButton(java.lang.String nombre, java.lang.Integer posX, java.lang.Integer posY){

        this.lugar = nombre;
        this.posX = posX;
        this.posY = posY;


        this.primero = false;
        this.wlButton = new Button();

        wlButton.setText(lugar);
        wlButton.setLayoutX(posX);
        wlButton.setLayoutY(posY);
    }

    public Button getWlButton() {
        return wlButton;
    }

    public void setWlButton(Button wlButton) {
        this.wlButton = wlButton;
    }

    @Override
    public void setPrimero(java.lang.Boolean primero) {
        this.primero = primero;
    }

    @Override
    public Boolean getPrimero() {
        return primero;
    }

    @Override
    public java.lang.String getLugar() {
        return lugar;
    }

    @Override
    public java.lang.Integer getPosX() {
        return posX;
    }

    @Override
    public java.lang.Integer getPosY() {
        return posY;
    }

    @Override
    public Integer getPosX2() {
        return null;
    }

    @Override
    public Integer getPosY2() {
        return null;
    }

    @Override
    public Integer getPeso() {
        return null;
    }

    public java.lang.Integer getRadio() {
        return radio;
    }

    @Override
    public void draw(Pane layout) {

        layout.getChildren().add(this.getWlButton());
    }
}
