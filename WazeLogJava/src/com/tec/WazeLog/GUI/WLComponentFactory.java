package com.tec.WazeLog.GUI;

import javax.swing.*;

public class WLComponentFactory {


    /**
     * Constructor
     */
    public WLComponentFactory() {
    }

    /**
     * @param comp Nombre del componente que se desea crear
     * @param nombre nombre del elemento mostrado en pantalla
     * @param posX posicion el X del componente
     *             Si este posee 2 posiciones en X esta sería la primera
     * @param posY posicion el Y del componente
     *             Si este posee 2 posiciones en Y esta sería la primera
     * @param posX2 Segunda posicion en X del componente
     *              no todos poseen una segunda posicion en X
     * @param posY2 Segunda posicion en Y del componente
     *              no todos poseen una segunda posicion en Y
     * @param peso Peso del componente
     *             funciona solo lineas y labels
     * @param radio Radio del circulo si se crea uno
     * @return Un componente de la interfaz
     */
    public WLComponent getComponent(java.lang.String comp, java.lang.String nombre, java.lang.Integer posX,
                                    java.lang.Integer posY, java.lang.Integer posX2, java.lang.Integer posY2,
                                    java.lang.Integer peso, java.lang.Integer radio){
        if (comp == null){
            return null;
        }else if (comp == "Button"){
            return  new WLButton(nombre, posX, posY, radio);
        }else if (comp == "Label"){
            return new WLLabel(peso, posX, posY);
        }else if (comp == "Line"){
            return new WLLine(peso, posX, posY, posX2, posY2);
        }else {
            JOptionPane.showMessageDialog(new JFrame("Aviso"),"No se reconocio el componente que" +
                    "se desea crear");
        }
        return null;
    }
}
