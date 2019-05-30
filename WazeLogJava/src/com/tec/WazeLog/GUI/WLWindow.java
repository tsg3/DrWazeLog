package com.tec.WazeLog.GUI;

import com.tec.WazeLog.grafos.*;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.scene.control.Button;

import java.util.ArrayList;

public class WLWindow{

    public WLStage stage;
    public WLLayout layout;
    public ArrayList<WLComponent> buttons;
    public ArrayList<WLComponent> lines;
    public ArrayList<WLComponent> pesos;
    public WLComponent restartButton;
    public WLTextfield dInicio;
    public WLTextfield dFinal;
    public WLTextfield newPeso;
    public WLScene scene;
    public GrafoD grafo;
    public WLComponentFactory factory;



    public WLWindow(java.lang.Integer width, java.lang.Integer height, java.lang.String titulo) {
        this.stage = new WLStage(titulo);
        this.layout = new WLLayout();
        this.buttons = new ArrayList<WLComponent>();
        this.lines = new ArrayList<WLComponent>();
        this.pesos = new ArrayList<WLComponent>();
        this.restartButton = new WLButton("Load", width - 230, height - 40);
        this.dInicio = new WLTextfield(this.layout.getLayout());
        this.dFinal = new WLTextfield(this.layout.getLayout());
        this.newPeso = new WLTextfield(this.layout.getLayout());

        this.dInicio.getText().setLayoutX(width - 390);
        this.dInicio.getText().setLayoutY(height - 100);
        this.dFinal.getText().setLayoutX(width - 205);
        this.dFinal.getText().setLayoutY(height - 100);
        this.newPeso.getText().setLayoutX(width - 300);
        this.newPeso.getText().setLayoutY(height - 70);


        this.layout.getLayout().getChildren().add(this.restartButton.getWlButton());
        this.scene = new WLScene(width, height, this.layout);
        this.grafo = new GrafoD();
        this.factory = new WLComponentFactory();



    }


/*

    @Override
    public void start(Stage stage) throws Exception {

        createLines();
        createbuttons();
        createPesos();

        for (WLLine l : this.lines){
            this.layout.getLayout().getChildren().add(l.getLine());
        }
        for (WLButton b : this.buttons){
            this.layout.getLayout().getChildren().add(b.getWlButton());
        }
        for (WLLabel n : this.pesos){
            this.layout.getLayout().getChildren().add(n.getLabel());
        }

        this.stage.getStage().show();


    }
*/
    public void addRoute (java.lang.String nodoInicio, java.lang.String nodoFinal, java.lang.Integer peso){


        this.grafo.addArista(nodoInicio, nodoFinal, peso);

        this.grafo.addArista(nodoFinal, nodoInicio, peso);



    }

    public void createbuttons(){

        java.lang.Integer i = 10;
        java.lang.Integer j = 10;

        java.lang.Integer sumai = 400;
        java.lang.Integer sumaj = 200;

        java.lang.Integer even = 0;

        for (Nodo n : grafo.getNodos()){

            if (even == 0){

                this.buttons.add(factory.getComponent("Button", n.getNombre(), i, j, 0, 0, 0, 100));
                i += 400;
                j += 50;
                even += 1;
            }else if (even == 1){

                this.buttons.add(factory.getComponent("Button", n.getNombre(), i, j, 0, 0, 0, 100));
                j += sumaj - 50;
                i -= 300;
                even += 1;

            }else if (even == 2){
                this.buttons.add(factory.getComponent("Button", n.getNombre(), i, j, 0, 0, 0, 100));
                i += 400;
                j += 50;
                even += 1;
            }else{
                this.buttons.add(factory.getComponent("Button", n.getNombre(), i, j, 0, 0, 0, 100));
                j += sumaj - 50;
                i -= 500;
                even = 0;

                if (j >= 800){
                    j = 10;
                    i = 610;
                    sumaj = 250;
                }
            }
        }


    }

    public void createLines(){
        for(Arista a : this.grafo.getAristas()){


            for (WLComponent b : this.buttons){


                if (a.getNInicio().getNombre().equals(b.getWlButton().getText())){


                    for(WLComponent b2 : this.buttons){

                        if (a.getNFinal().getNombre().equals(b2.getWlButton().getText())){

                            this.lines.add(factory.getComponent("Line", "", b.getPosX(), b.getPosY(), b2.getPosX(),
                                    b2.getPosY(), a.getPeso(), 0));

                            break;
                        }
                    }
                    break;

                }
            }

        }
    }

    public void createPesos(){
        for (WLComponent l : this.lines){

            this.pesos.add(factory.getComponent("Label", "", (l.getPosX() + l.getPosX2())/2,
                  (l.getPosY() + l.getPosY2())/2, 0 , 0 , l.getPeso(), 0));

        }

    }

    public WLComponent getRestartButton() {
        return restartButton;
    }

    public WLTextfield getdInicio() {
        return dInicio;
    }

    public WLTextfield getdFinal() {
        return dFinal;
    }

    public WLTextfield getNewPeso() {
        return newPeso;
    }

    public void setStage(WLStage stage) {
        this.stage = stage;
    }

    public void setScene(WLScene scene) {
        this.scene = scene;
    }

    public WLStage getStage() {
        return stage;
    }

    public WLLayout getLayout() {
        return layout;
    }

    public ArrayList<WLComponent> getButtons() {
        return buttons;
    }

    public ArrayList<WLComponent> getLines() {
        return lines;
    }

    public ArrayList<WLComponent> getPesos() {
        return pesos;
    }

    public WLScene getScene() {
        return scene;
    }

    public GrafoD getGrafo() {
        return grafo;
    }

}
