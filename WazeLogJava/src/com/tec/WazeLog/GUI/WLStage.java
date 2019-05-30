package com.tec.WazeLog.GUI;


import com.tec.WazeLog.grafos.*;

import javafx.stage.Stage;

public class WLStage {

    public Stage stage;

    public WLStage(java.lang.String titulo) {
        this.stage = new Stage();
        this.stage.setTitle(titulo);
    }

    public Stage getStage() {
        return stage;
    }
}
