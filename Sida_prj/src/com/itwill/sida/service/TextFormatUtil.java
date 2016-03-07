package com.itwill.sida.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface TextFormatUtil {

	ArrayList<HashMap<String, String>> head_Nav_CardUseList(String sMemberEmail);

	String getTimeGap(String cardUseTime);

}