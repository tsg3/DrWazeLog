package com.tec.WazeLog.GUI;

import com.tec.WazeLog.grafos.*;

import javafx.scene.layout.Pane;

public class WLLayout {

    public Pane layout;

    /**
     * Constructor
     */
    public WLLayout() {
        this.layout = new Pane();
    }

    /**
     * @return Pane como layout de la escena
     */
    public Pane getLayout() {
        return layout;
    }
}
