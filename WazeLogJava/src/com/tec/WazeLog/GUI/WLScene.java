package com.tec.WazeLog.GUI;

import com.tec.WazeLog.grafos.*;

import javafx.scene.Scene;

public class WLScene {

    public Scene scene;

    public WLScene (java.lang.Integer width, java.lang.Integer height, WLLayout layout){

        this.scene = new Scene(layout.getLayout(), width, height);
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }

    public Scene getScene() {
        return scene;
    }
}
