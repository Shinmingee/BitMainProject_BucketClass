package com.pap.bucketclass.support;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.AttributeConverter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pap.bucketclass.model.ResponseModel;

public class JsonToStringConverter <T extends Object> implements AttributeConverter<Collection<T>, String> {
	
    private final ObjectMapper objectMapper;

    public JsonToStringConverter() {
        this.objectMapper = new ObjectMapper();
    }
	
	@Override
	public String convertToDatabaseColumn(Collection<T> attribute) {
        String jsonString = null;
        try {
            jsonString = objectMapper.writeValueAsString(attribute);
        } catch (JsonProcessingException ex) {
            ex.printStackTrace();
        }
        return jsonString;
	}

	@Override
	public Collection<T> convertToEntityAttribute(String dbData) {
        Collection<T> objectArray = new ArrayList<>();
        try {
            objectArray = objectMapper.readValue(dbData, new TypeReference<T>() {});
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (NullPointerException ex) {
            ex.printStackTrace();
        }
        return objectArray;
	}
	
}
