package com.itwill.sida.dto;

import java.util.ArrayList;
import java.util.HashMap;

public class MoneyUseResult {
	private String this_Jan;
	private String this_Feb;
	private String this_Mar;
	private String this_Apr;
	private String this_May;
	private String this_Jun;
	private String this_Jul;
	private String this_Aug;
	private String this_Sep;
	private String this_Oct;
	private String this_Nov;
	private String this_Dec;

	private String last_Jan;
	private String last_Feb;
	private String last_Mar;
	private String last_Apr;
	private String last_May;
	private String last_Jun;
	private String last_Jul;
	private String last_Aug;
	private String last_Sep;
	private String last_Oct;
	private String last_Nov;
	private String last_Dec;
	
	private ArrayList<HashMap<String, String>> cardList;

	@Override
	public String toString() {
		return "MoneyUseResult [this_Jan=" + this_Jan + ", this_Feb=" + this_Feb + ", this_Mar=" + this_Mar
				+ ", this_Apr=" + this_Apr + ", this_May=" + this_May + ", this_Jun=" + this_Jun + ", this_Jul="
				+ this_Jul + ", this_Aug=" + this_Aug + ", this_Sep=" + this_Sep + ", this_Oct=" + this_Oct
				+ ", this_Nov=" + this_Nov + ", this_Dec=" + this_Dec + ", last_Jan=" + last_Jan + ", last_Feb="
				+ last_Feb + ", last_Mar=" + last_Mar + ", last_Apr=" + last_Apr + ", last_May=" + last_May
				+ ", last_Jun=" + last_Jun + ", last_Jul=" + last_Jul + ", last_Aug=" + last_Aug + ", last_Sep="
				+ last_Sep + ", last_Oct=" + last_Oct + ", last_Nov=" + last_Nov + ", last_Dec=" + last_Dec
				+ ", cardList=" + cardList + "]";
	}

	public ArrayList<HashMap<String, String>> getCardList() {
		return cardList;
	}
	
	public void setCardList(ArrayList<HashMap<String, String>> cardList) {
		this.cardList = cardList;
	}
	
	public String getThis_Jan() {
		return this_Jan;
	}
	public void setThis_Jan(String this_Jan) {
		this.this_Jan = this_Jan;
	}
	public String getThis_Feb() {
		return this_Feb;
	}
	public void setThis_Feb(String this_Feb) {
		this.this_Feb = this_Feb;
	}
	public String getThis_Mar() {
		return this_Mar;
	}
	public void setThis_Mar(String this_Mar) {
		this.this_Mar = this_Mar;
	}
	public String getThis_Apr() {
		return this_Apr;
	}
	public void setThis_Apr(String this_Apr) {
		this.this_Apr = this_Apr;
	}
	public String getThis_May() {
		return this_May;
	}
	public void setThis_May(String this_May) {
		this.this_May = this_May;
	}
	public String getThis_Jun() {
		return this_Jun;
	}
	public void setThis_Jun(String this_Jun) {
		this.this_Jun = this_Jun;
	}
	public String getThis_Jul() {
		return this_Jul;
	}
	public void setThis_Jul(String this_Jul) {
		this.this_Jul = this_Jul;
	}
	public String getThis_Aug() {
		return this_Aug;
	}
	public void setThis_Aug(String this_Aug) {
		this.this_Aug = this_Aug;
	}
	public String getThis_Sep() {
		return this_Sep;
	}
	public void setThis_Sep(String this_Sep) {
		this.this_Sep = this_Sep;
	}
	public String getThis_Oct() {
		return this_Oct;
	}
	public void setThis_Oct(String this_Oct) {
		this.this_Oct = this_Oct;
	}
	public String getThis_Nov() {
		return this_Nov;
	}
	public void setThis_Nov(String this_Nov) {
		this.this_Nov = this_Nov;
	}
	public String getThis_Dec() {
		return this_Dec;
	}
	public void setThis_Dec(String this_Dec) {
		this.this_Dec = this_Dec;
	}
	public String getLast_Jan() {
		return last_Jan;
	}
	public void setLast_Jan(String last_Jan) {
		this.last_Jan = last_Jan;
	}
	public String getLast_Feb() {
		return last_Feb;
	}
	public void setLast_Feb(String last_Feb) {
		this.last_Feb = last_Feb;
	}
	public String getLast_Mar() {
		return last_Mar;
	}
	public void setLast_Mar(String last_Mar) {
		this.last_Mar = last_Mar;
	}
	public String getLast_Apr() {
		return last_Apr;
	}
	public void setLast_Apr(String last_Apr) {
		this.last_Apr = last_Apr;
	}
	public String getLast_May() {
		return last_May;
	}
	public void setLast_May(String last_May) {
		this.last_May = last_May;
	}
	public String getLast_Jun() {
		return last_Jun;
	}
	public void setLast_Jun(String last_Jun) {
		this.last_Jun = last_Jun;
	}
	public String getLast_Jul() {
		return last_Jul;
	}
	public void setLast_Jul(String last_Jul) {
		this.last_Jul = last_Jul;
	}
	public String getLast_Aug() {
		return last_Aug;
	}
	public void setLast_Aug(String last_Aug) {
		this.last_Aug = last_Aug;
	}
	public String getLast_Sep() {
		return last_Sep;
	}
	public void setLast_Sep(String last_Sep) {
		this.last_Sep = last_Sep;
	}
	public String getLast_Oct() {
		return last_Oct;
	}
	public void setLast_Oct(String last_Oct) {
		this.last_Oct = last_Oct;
	}
	public String getLast_Nov() {
		return last_Nov;
	}
	public void setLast_Nov(String last_Nov) {
		this.last_Nov = last_Nov;
	}
	public String getLast_Dec() {
		return last_Dec;
	}
	public void setLast_Dec(String last_Dec) {
		this.last_Dec = last_Dec;
	}
}
