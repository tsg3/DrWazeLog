package com.tec.WazeLog.grafos;

import java.util.ArrayList;
import java.util.Collections;

/**
 * Clase que controla a las demas clases
 * en el paquete y crea un grafo dirigido 
 * con ellas
 * @author Bradly Valverde Fernandez
 *
 */
public class GrafoD {

	private ArrayList<Nodo> Nodos;
	private ArrayList<Arista> Aristas;

	/**
	 * Constructor
	 */
	public GrafoD() {

		this.Aristas = new ArrayList<Arista>();
		this.Nodos = new ArrayList<Nodo>();
	}

	/**
	 * A�ade una arista al grafo dirigido
	 * junto con los 2 nodos de cada extremo
	 * @param nodoInicio String del Nodo de inicio de la arista
	 * @param nodoFinal String del Nodo al que va dirigido la arista
	 * @param peso Peso de la arista
	 */
	public void addArista(java.lang.String nodoInicio, java.lang.String nodoFinal, java.lang.Integer peso) {

		Nodo nTemp1 = new Nodo(nodoInicio);
		Nodo nTemp2 = new Nodo(nodoFinal);

		Arista aTemp = new Arista(peso, nTemp1, nTemp2);

		nTemp1.addArista(aTemp);

		if (!containsNodo(nodoInicio) && !containsNodo(nodoFinal)) {
			this.Nodos.add(nTemp1);
			this.Nodos.add(nTemp2);
			if (!containsArista(aTemp)) {
				this.Aristas.add(aTemp);
			}

		} else if (!containsNodo(nodoInicio)) {
			this.Nodos.add(nTemp1);
			if (!containsArista(aTemp)) {
				this.Aristas.add(aTemp);
			}
		} else if (!containsNodo(nodoFinal)) {
			this.Nodos.add(nTemp2);
			if (!containsArista(aTemp)) {
				addAristaToNodo(nodoInicio, aTemp);
				this.Aristas.add(aTemp);
			}
		} else {
			if (!containsArista(aTemp)) {
				this.Aristas.add(aTemp);
				addAristaToNodo(nodoInicio, aTemp);
			}
		}

	}

	/**
	 * Devuelve el grado saliente 
	 * del nodo especificado
	 * @param nodo String del nodo al que se le busca el grado saliente
	 * @return La cantidad de arista que salen de ese nodo
	 */
	public java.lang.Integer getGradoSaliente(java.lang.String nodo) {

		java.lang.Integer result = 0;

		for (Nodo n : this.Nodos) {

			if (n.getNombre().equals(nodo)) {

				for (Arista a : this.Aristas) {
					if (a.getNInicio().getNombre().equals(nodo)) {

						result += 1;

					}

				}
				break;

			}

		}
		return result;
	}

	/**
	 * Devuelve el grado entrante
	 * del nodo especificado
	 * @param nodo String del nodo al que se le busca el grado Entrante
	 * @return La cantidad de arista que entran a ese nodo
	 */
	public java.lang.Integer getGradoEntrante(java.lang.String nodo) {

		java.lang.Integer result = 0;

		for (Nodo n : this.Nodos) {

			if (n.getNombre().equals(nodo)) {

				for (Arista a : this.Aristas) {
					if (a.getNFinal().getNombre().equals(nodo)) {

						result += 1;

					}

				}
				break;

			}

		}
		return result;
	}



	/**
	 * A�ade una arista al
	 * nodo que se busca dentro de la 
	 * lista de nodos del grafo dirigido
	 * @param nodoInicio Nodo al que se le desea a�adir la arista
	 * @param arista arista a a�adir
	 */
	private void addAristaToNodo(java.lang.String nodoInicio, Arista arista) {

		for (Nodo n : this.Nodos) {

			if (n.getNombre().equals(nodoInicio)) {
				n.addArista(arista);
			}

		}

	}

	/**
	 * Busca un nodo dentro de la 
	 * lista de de nodos del grafo
	 * @param nodo Nodo a buscar
	 * @return booleano true si se encuentra el nodo y false si no
	 */
	private java.lang.Boolean containsNodo(java.lang.String nodo) {
		java.lang.Boolean result = false;

		for (Nodo n : this.Nodos) {

			if (n.getNombre().equals(nodo)) {
				result = true;
			}
		}

		return result;
	}

	/**
	 * Busca una arista dentro de la 
	 * lista de aristas del grafo
	 * @param arista Arista a buscar
	 * @return booleano true si se encuentra la arista y false si no
	 */
	private java.lang.Boolean containsArista(Arista arista) {
		java.lang.Boolean result = false;

		for (Arista a : this.Aristas) {

			if (a.getNInicio().getNombre().equals(arista.getNInicio().getNombre())
					&& a.getNFinal().getNombre().equals(arista.getNFinal().getNombre())) {

				result = true;

			}
		}
		return result;

	}

	/**
	 * Getters
	 */
	
	public ArrayList<Nodo> getNodos() {
		return Nodos;
	}

	public ArrayList<Arista> getAristas() {
		return Aristas;
	}

}
