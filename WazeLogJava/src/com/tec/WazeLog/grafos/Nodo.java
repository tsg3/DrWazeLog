package com.tec.WazeLog.grafos;

import java.util.ArrayList;
import java.util.Comparator;

/**
 * Esta clase posee a los nodos del grafo 
 * los cuales tiene un String para distinguir
 * unos de otros, una lista de arista para
 * saber cuales aristas salen de el, un grado 
 * saliente que da la cantidad de aristas 
 * que salen del nodo y un grado entrante que 
 * da cuales aristas entran a el
 * @author Bradly Valverde Fernandez
 *
 */
public class Nodo {
	private java.lang.String nombre;
	private ArrayList<Arista> Aristas;
	private java.lang.Integer Gsaliente;
	private java.lang.Integer Gentrante;

	/**
	 * Contructor
	 * @param nombre Nombre para diferenciar el nodo
	 */
	public Nodo(java.lang.String nombre) {

		this.nombre = nombre;
		this.Aristas = new ArrayList<Arista>();
		this.Gsaliente = 0;
		this.Gentrante = 0;
	}
	
	/**
	 * A�ade una arista a su lista de aristas
	 * @param arista Arista a a�adir
	 */
	public void addArista(Arista arista) {

		if (!containsArista(arista)) {
			this.Aristas.add(arista);
		}

	}
	
	/**
	 * Elimina una arista de su lista de aristas
	 * @param arista Arista a eliminar
	 */
	public void deleteArista(Arista arista) {

		java.lang.Integer index = 0;

		for (Arista a : this.Aristas) {

			if (a.getNInicio().getNombre().equals(arista.getNInicio().getNombre())
					&& a.getNFinal().getNombre().equals(arista.getNFinal().getNombre())) {
				break;

			}
			index++;

		}
		if (index >= this.Aristas.size()) {

			System.out.println("El objeto a eliminar no existe");

		} else {

			this.Aristas.remove(index);
		}

	}

	/**
	 * Busca una arista dentro de la 
	 * lista de aristas del nodo
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
	 * Getter y Setter
	 */
	
	public java.lang.String getNombre() {
		return nombre;
	}

	public ArrayList<Arista> getAristas() {
		return Aristas;
	}

	public java.lang.Integer getGsaliente() {
		return Gsaliente;
	}

	public void setGsaliente(java.lang.Integer gsaliente) {
		Gsaliente = gsaliente;
	}

	public java.lang.Integer getGentrante() {
		return Gentrante;
	}

	public void setGentrante(int gentrante) {
		Gentrante = gentrante;
	}

}
