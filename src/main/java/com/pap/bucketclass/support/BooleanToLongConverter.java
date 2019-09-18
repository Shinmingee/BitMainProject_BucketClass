package com.pap.bucketclass.support;

import javax.persistence.AttributeConverter;

public class BooleanToLongConverter implements AttributeConverter<Boolean, Long>{

	@Override
	public Long convertToDatabaseColumn(Boolean attribute) {
		return (long) (attribute ? 1 : 0);
	}

	@Override
	public Boolean convertToEntityAttribute(Long dbData) {
		return dbData != 0;
	}
	
}
