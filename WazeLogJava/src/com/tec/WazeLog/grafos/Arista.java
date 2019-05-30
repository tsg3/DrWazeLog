package com.tec.WazeLog.grafos;
/**
 * Esta clase posee a las aristas del grafo
 * las cuales tienen un nodo de inicio
 * y van dirigidas a un nodo de llegada
 * con su propios peso
 * 
 * @author Bradly Valverde Fernandez
 *
 */
public class Arista {
	
	private java.lang.Integer peso;
	private Nodo NInicio;
	private Nodo NFinal;
	
	
	/**
	 * Constructor
	 * @param peso Peso de la arista
	 * @param nInicio Nodo en el que inicia la arista
	 * @param nFinal Nodo al que va la arista
	 */
	public Arista(java.lang.Integer peso, Nodo nInicio, Nodo nFinal) {
		
		this.peso = peso;
		NInicio = nInicio;
		NFinal = nFinal;
		
	}
	
	/**
	 * Getter y Setter
	 */
	
	public java.lang.Integer getPeso() {
		return peso;
	}
	public void setPeso(java.lang.Integer peso) {
		this.peso = peso;
	}
	public Nodo getNInicio() {
		return NInicio;
	}
	public void setNInicio(Nodo nInicio) {
		NInicio = nInicio;
	}
	public Nodo getNFinal() {
		return NFinal;
	}
	public void setNFinal(Nodo nFinal) {
		NFinal = nFinal;
	}
	
	
	
}
