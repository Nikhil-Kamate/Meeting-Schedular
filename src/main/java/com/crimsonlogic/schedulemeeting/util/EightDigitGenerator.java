package com.crimsonlogic.schedulemeeting.util;

import java.io.Serializable;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.internal.SessionImpl;

public class EightDigitGenerator implements IdentifierGenerator {

    private static final String SEQUENCE_NAME = "meeting_id_seq";

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
        try {
            // Use Hibernate's Session to execute a native SQL query to get the next value from the sequence
            String query = "SELECT nextval('" + SEQUENCE_NAME + "')";
            Number sequenceValue = (Number) ((SessionImpl) session).createNativeQuery(query).getSingleResult();
            
            // Convert the sequence value to a six-digit number with leading zeros
            String formattedNumber = String.format("%06d", sequenceValue.longValue());

            // Concatenate the prefix "met-" with the formatted six-digit number
            return "met-" + formattedNumber;

        } catch (Exception e) {
            throw new HibernateException("Unable to generate ID", e);
        }
    }
}

