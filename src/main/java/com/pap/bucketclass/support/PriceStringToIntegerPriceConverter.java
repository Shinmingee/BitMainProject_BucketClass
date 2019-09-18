package com.pap.bucketclass.support;

import javax.persistence.AttributeConverter;

import com.pap.bucketclass.util.ConverterPackage;

public class PriceStringToIntegerPriceConverter  implements AttributeConverter<String, Integer>{

	//ex)"500000"
	@Override
	public Integer convertToDatabaseColumn(String attribute) {
		if(attribute==null) {
			attribute = "0";
		}
		return Integer.parseInt(attribute);
	}

	//ex)500000
	@Override
	public String convertToEntityAttribute(Integer dbData) {
		String priceString = Integer.toString(dbData);
		return ConverterPackage.convertStringToPriceFormat(priceString);
	}

}
