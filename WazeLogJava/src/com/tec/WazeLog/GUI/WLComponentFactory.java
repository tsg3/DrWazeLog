package com.tec.WazeLog.GUI;

import javax.swing.*;

public class WLComponentFactory {


    public WLComponentFactory() {
    }

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
