package com.tec.WazeLog.GUI;

import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;

public class WLLabel implements WLComponent{

    public Label label;

    /**Constructor
     * @param label  Peso de la linea a la que se le atribuye este label
     * @param posX Posicion en X del label
     * @param posY Posicion en Y del label
     */
    public WLLabel (java.lang.Integer label, java.lang.Integer posX, java.lang.Integer posY){

        this.label = new Label(label.toString());
        this.label.setLayoutX(posX);
        this.label.setLayoutY(posY);


    }

    /**
     * Getters y Setters
     */

    public Label getLabel() {
        return label;
    }

    @Override
    public void draw(Pane layout) {
        layout.getChildren().add(this.label);
    }

    @Override
    public void setPrimero(Boolean primero) {

    }

    @Override
    public Integer getPosX() {
        return null;
    }

    @Override
    public Integer getPosY() {
        return null;
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
}
