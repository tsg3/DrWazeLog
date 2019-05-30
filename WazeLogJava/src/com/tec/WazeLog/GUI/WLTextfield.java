package com.tec.WazeLog.GUI;


import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;

public class WLTextfield {

    TextField text;

    /**
     * @param layout Pane donde aparecerá la caja de texto
     */
    public WLTextfield(Pane layout){
        this.text = new TextField();
        layout.getChildren().add(text);
    }

    /**
     * @return obtiene la caja de texto
     */
    public TextField getText() {
        return text;
    }
}
