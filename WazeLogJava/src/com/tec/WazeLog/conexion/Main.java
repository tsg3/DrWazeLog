package com.tec.WazeLog.conexion;

import java.io.IOException;

public class Main {


    public static void main(String[] args) throws IOException {

        PLConexion conexion = new PLConexion();


        java.lang.String a = conexion.getRuta("consult('DrWazeLog.pl')", "ruta(X, Y, Peso)", "X", 0);
        System.out.println(a);


        conexion.addRuta("DrWazeLog.pl", "si", "sirvio", 100);
    }
}
