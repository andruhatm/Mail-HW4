package ru.mail.flyway;

import org.flywaydb.core.Flyway;

public class Main {

	public static void main(String[] args) {
		final Flyway flyway = Flyway.configure()
						.dataSource("jdbc:postgresql://localhost:5432/mail-lab4","postgres","кщще")
						.locations("db/migration")
						.load();

		flyway.clean();
		flyway.migrate();
		System.out.println("Hello world");
	}
}
