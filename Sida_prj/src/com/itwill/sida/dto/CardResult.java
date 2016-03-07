package com.itwill.sida.dto;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="CardList")
public class CardResult {
	private ArrayList<Card> cardList;
	private int size;
	
	@XmlElement(name="Card")
	public ArrayList<Card> getCardList() {
		return cardList;
	}
	public void setCardList(ArrayList<Card> cardList) {
		this.cardList = cardList;
	}
	
	@XmlElement(name="size")
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
}
