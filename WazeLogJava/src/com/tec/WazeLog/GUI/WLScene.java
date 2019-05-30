package com.tec.WazeLog.GUI;

import com.tec.WazeLog.grafos.*;

import javafx.scene.Scene;

public class WLScene {

    public Scene scene;

    /**
     * @param width Ancho de la escena donde se pintaran los componentes
     * @param height Alto de la escena donde se pintaran los componentes
     * @param layout Pane de donde provienen los componentes
     */
    public WLScene (java.lang.Integer width, java.lang.Integer height, WLLayout layout){

        this.scene = new Scene(layout.getLayout(), width, height);
    }

    /**
     *Set y Get de la escena
     */
    public void setScene(Scene scene) {
        this.scene = scene;
    }

    public Scene getScene() {
        return scene;
    }
}
