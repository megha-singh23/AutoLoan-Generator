package com.autoloan.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.autoloan.model.Loan;
import com.autoloan.model.User;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    static {
        try {
            // Create StandardServiceRegistry
            StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                    .build();
            // Create Metadata and add annotated classes
            Metadata metadata = new MetadataSources(registry)
            		.addAnnotatedClass(User.class)
            		.addAnnotatedClass(Loan.class)
                    .getMetadataBuilder()
                    .build();

            // Build SessionFactory
            sessionFactory = metadata.getSessionFactoryBuilder().build();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error initializing Hibernate SessionFactory: " + e.getMessage());
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
