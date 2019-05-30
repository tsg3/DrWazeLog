package com.tec.WazeLog.conexion;

import org.jpl7.Query;
import org.jpl7.Term;

import java.io.*;
import java.util.ArrayList;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

/**
 * Clase que escribe y consulta la base
 * de datos en un archivo prolog
 *
 * @author Bradly Valverde Fernandez
 */

public class PLConexion {


    private Query query1;
    private Query query2;
    private Map<java.lang.String, Term>[] solutions;


    /**
     * Constructor
     */
    public PLConexion() {

    }


    /**
     * Obtiene una solucion para para cierto hecho del archivo a consultar
     * en una posicion pos en la lista de soluciones
     * @param consult   Archivo al que se va a consultar "consult('archivo')"
     * @param hecho     Hecho de la base de datos del archivo
     * @param direccion parametro del hecho al que se consulta
     * @param pos       posicion del la lista solutions
     * @return Una solucion de la base de datos de ese archivo prolog
     */
    public java.lang.String getRuta(java.lang.String consult, java.lang.String hecho, java.lang.String direccion,
                                    java.lang.Integer pos) {

        query1 = new Query(consult);

        query1.hasSolution();

        query2 = new Query(hecho);

        solutions = query2.allSolutions();


        return solutions[pos].get(direccion).toString();

    }

    /**Obtiene la ruta mas corta para un punto inicial a uno final
     * @param consult Archivo al que se va a consultar "consult('archivo')"
     * @param dInicia Nombre de la direccion inicial
     * @param dFinal Nombre de la direccion final
     * @return ruta mas corta de las 2 direcciones
     */
    public java.lang.String getRuta(java.lang.String consult, java.lang.String dInicia,
                                    java.lang.String dFinal) {
        query1 = new Query(consult);

        query1.hasSolution();

        query2 = new Query("viajar(" + dInicia + ", [], " + dFinal + ", [], 0, X, Y)");

        java.lang.String a = query2.oneSolution().get("X").toString().replace("[", "")
                .replace("|", "").replace("]", "").replace("'", "")
                .replace("(", "").replace(")", "");
        return "La Ruta mas corta es por " + a +
                " con un costo de " + query2.oneSolution().get("Y") + " horas";

    }

    /**
     * @param consult Archivo al que se va a consultar "consult('archivo')"
     * @param hecho  hecho de la base de datos donde se agarran sus variables
     * @return
     */
    public java.lang.Integer getLength(java.lang.String consult, java.lang.String hecho) {

        query1 = new Query(consult);

        query1.hasSolution();

        query2 = new Query(hecho);

        solutions = query2.allSolutions();


        return solutions.length;

    }


    /**
     * @param ruta Ruta del archivo al que se va a escribir
     * @param pInicial Direccion inicial seleccionada
     * @param pFinal Direccion final seleccionada
     * @param peso Peso de la nueva conexion
     * @throws IOException Excepcion si no se encuentra ruta
     */
    public void addRuta(java.lang.String ruta, java.lang.String pInicial, java.lang.String pFinal, java.lang.Integer peso)
            throws IOException {

        BufferedReader br = new BufferedReader(new FileReader(ruta));

        ArrayList<java.lang.String> list = new ArrayList<String>();

        java.lang.String st;

        while ((st = br.readLine()) != null) {

            if (st.startsWith("ruta(")) {
                list.add("ruta(" + pInicial.toLowerCase() + ", " + pFinal.toLowerCase() + ", " + peso + ").");
                list.add(st);

                break;
            }
            list.add(st);
        }
        while ((st = br.readLine()) != null) {
            list.add(st);

        }

        Files.write(Paths.get(ruta), list);
    }


}
