package com.pap.bucketclass;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

class JavaObject{
	
	private String attribute;

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
}

public class JavaTest {

	public static void JSONtester() throws JsonParseException, JsonMappingException, IOException {
		List<String> strArr = new ArrayList<String>();

		strArr.add("A");
		strArr.add("B");
		strArr.add("C");

		System.out.println(strArr);

		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(strArr);
		System.out.println(jsonInString);

		List<String> result = mapper.readValue(jsonInString, List.class);
		System.out.println(result);
	}

	public static void stringPriceConverter(String price) {

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
		System.out.println(priceFormat.toString());
	}

	enum ParserForDate{
		//DATE:		2  0  1  7  0  8  2  7  1  8  1  2  0  0
		//INDEX:	0  1  2  3  4  5  6  7  8  9  10 11 12 13
		YEAR(0,4){
			@Override
			int parse(String date) {
				return Integer.parseInt(date.substring(getStartIndex(),getEndIndex()).trim());}
		}
		, MONTH(4,6){
			@Override
			int parse(String date) {
				return Integer.parseInt(date.substring(getStartIndex(),getEndIndex()).trim());}
		}
		, DAY(6,8){
			@Override
			int parse(String date) {
				return Integer.parseInt(date.substring(getStartIndex(),getEndIndex()).trim());}
		}
		, HOUR(8,10){
			@Override
			int parse(String date) {
				return Integer.parseInt(date.substring(getStartIndex(),getEndIndex()).trim());}
		}
		, MINUTE(10,12){
			int parse(String date) {
				return Integer.parseInt(date.substring(getStartIndex(),getEndIndex()).trim());}	
		}
		, SECOND(12,14){
			int parse(String date) {
				return Integer.parseInt(date.substring(getStartIndex(),getEndIndex()).trim());}
		}
		;

		protected final int startIndex;
		protected final int endIndex;

		ParserForDate(int startIndex, int endIndex){
			this.startIndex = startIndex;
			this.endIndex = endIndex;
		}

		public int getStartIndex() {
			return startIndex;
		}

		public int getEndIndex() {
			return endIndex;
		}

		abstract int parse(String date);
	}

	public static void stringToTimestampConverter(String date) {

		LocalDateTime time = LocalDateTime.of(
				ParserForDate.YEAR.parse(date),
				ParserForDate.MONTH.parse(date),
				ParserForDate.DAY.parse(date),
				ParserForDate.HOUR.parse(date),
				ParserForDate.MINUTE.parse(date),
				ParserForDate.SECOND.parse(date)
				);

		System.out.println(Timestamp.valueOf(time).getTime());


		/* Research
		long time = Timestamp.valueOf(LocalDateTime.now()).getTime();
		System.out.println(time);

		LocalDate ymd = LocalDate.of(2017,Month.of(8),27);
		LocalTime hms = LocalTime.of(18, 12, 00);
		LocalDateTime ldt = LocalDateTime.of(ymd, hms);
		System.out.println(ldt); 
		System.out.println(Timestamp.valueOf(ldt).getTime()); 
		long omg = Timestamp.valueOf(ldt).getTime();
		Date ohmygod = new Date(omg); 
		System.out.println(ohmygod);
		 */
	}

	public static void timestampToStringConverter(long timestamp) {
		Date date = new Date();
		date.setTime(timestamp);
		Timestamp time = new Timestamp(timestamp);
		System.out.println(time.toString());
	}

	public static void checkStringArraySortForPriceFormat() {
		String[] strArr = new String[] {"40000", "100000", "50000", "100", "5,000"};
		Arrays.sort(strArr);
		System.out.println(Arrays.toString(strArr));

		Integer[] intArr = new Integer[] {40000,100000,50000,100,5000};
		Arrays.sort(intArr);
		System.out.println(Arrays.toString(intArr));
	}

	public static void optionalObjectPractice(JavaObject obj) {
		Optional<JavaObject> opt = Optional.ofNullable(obj);
		System.out.println(opt);
 
		opt.ifPresent(new Consumer<JavaObject>() {
			@Override
			public void accept(JavaObject t) {
				System.out.println(" 원래 t : " + t.getAttribute());
				t.setAttribute("임의의 값이 부여됨");
				System.out.println("t 출력 : " + t.getAttribute());
			}
		});
		
		System.out.println(opt);
		JavaObject nullException = new JavaObject();
		nullException.setAttribute("excepted");
		JavaObject afterStr = opt.orElse(nullException);
		System.out.println(afterStr.getAttribute());
		
		System.out.println("========================");
		
	}

	public static void main(String[] args) throws IOException {
		//		JSONtester();
		//		stringPriceConverter("1543827932498800"); 
		//		stringToTimestampConverter("20170827181200");
		//		timestampToStringConverter(1503825120000L);
//		checkStringArraySortForPriceFormat();
//		JavaObject obj = new JavaObject();
//		obj.setAttribute("op");
//		optionalObjectPractice(obj);
//		optionalObjectPractice(null);
//		String strA = null;
//		String strB = "";
//		System.out.println("%"+strA);
//		System.out.println("%"+strB);
	}
}
