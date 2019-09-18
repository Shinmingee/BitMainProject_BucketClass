package com.pap.bucketclass.util;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ConverterPackage {
	
	/*
	 * JSON으로 부터 "20170817181200"와 같은 형태로 오는 String을 Timestamp 형식으로 바꿔줍니다.
	 */
	public static Timestamp convertDateStringToTimestamp(String dateString) {
		LocalDateTime time = LocalDateTime.of(
		ParserForDate.YEAR.parse(dateString),
		ParserForDate.MONTH.parse(dateString),
		ParserForDate.DAY.parse(dateString),
		ParserForDate.HOUR.parse(dateString),
		ParserForDate.MINUTE.parse(dateString),
		ParserForDate.SECOND.parse(dateString)
		);
		return Timestamp.valueOf(time);
	}
	
	/*
	 * JSON으로 부터 "8540000"와 같은 형태로 오는 String을 "8,540,000원"와 같이 바꿔줍니다. 
	 */
	public static String convertStringToPriceFormat(String price) {
		StringBuffer reverse = new StringBuffer();
		StringBuffer priceFormat = new StringBuffer();
		int sw = 3;
		int cnt = price.length() + (price.length() / 3) -1;
		
		for(int i = price.length()-1; i >= 0  ; i--) {
			reverse.append(price.charAt(i));
			if(reverse.length()==sw && reverse.length() != cnt) {
				reverse.append(",");
				sw+=4;
			}
		}
		
		for(int i = reverse.length()-1; i >= 0  ; i--) {
			priceFormat.append(reverse.charAt(i));
		}
		priceFormat.append("원");
		return priceFormat.toString();
	}

}
