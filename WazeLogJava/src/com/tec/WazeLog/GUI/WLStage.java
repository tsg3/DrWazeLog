package com.tec.WazeLog.GUI;


import com.tec.WazeLog.grafos.*;

import javafx.stage.Stage;

public class WLStage {

    public Stage stage;

    /** Constructor
     * @param titulo Titulo de la ventana
     */
    public WLStage(java.lang.String titulo) {
        this.stage = new Stage();
        this.stage.setTitle(titulo);
    }

    /**
     * @return Stage de la ventana
     */
    public Stage getStage() {
        return stage;
    }
}
