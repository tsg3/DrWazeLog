package com.tec.WazeLog.GUI;

import javafx.scene.control.Button;
import javafx.scene.layout.Pane;

/**
 * Interfaz para crear implementar el
 * factory con cada uno de los componentes
 * mostrados en pantalla
 */

public interface WLComponent {

    public void draw(Pane layout);
    public  void setPrimero(java.lang.Boolean primero);

    public  java.lang.Integer getPosX();
    public  java.lang.Integer getPosY();
    public  java.lang.Integer getPosX2();
    public  java.lang.Integer getPosY2();
    public  java.lang.Integer getPeso();

    public java.lang.String getLugar();

    public java.lang.Boolean getPrimero();

    public Button getWlButton();
}
