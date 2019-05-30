package com.tec.WazeLog.GUI;


import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;

public class WLTextfield {

    TextField text;

    public WLTextfield(Pane layout){
        this.text = new TextField();
        layout.getChildren().add(text);
    }

    public TextField getText() {
        return text;
    }
}
